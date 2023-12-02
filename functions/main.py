# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`
#
# from firebase_functions import https_fn
# from firebase_admin import initialize_app
# initialize_app()
#
#
# @https_fn.on_request()
# def on_request_example(req: https_fn.Request) -> https_fn.Response:
#     return https_fn.Response("Hello world!")

import requests
import firebase_admin
from firebase_admin import credentials, firestore
from datetime import datetime as dt

# Initialize Firebase Admin SDK
cred = credentials.Certificate('secret-2.json')
firebase_admin.initialize_app(cred)
db = firestore.client()


class HourlyForecast:
    def __init__(self, time_UNIX, temperature, wind_speed, inches_precipitation, user_availability):
        self.time_UNIX = time_UNIX
        self.temperature = temperature
        self.wind_speed = wind_speed
        self.inches_precipitation = inches_precipitation
        self.users_available = user_availability[self.time_UNIX.weekday() * 2 + 1 if self.time_UNIX.hour >= 13 else 0]
        self.frisbee_score = self.calculate_frisbee_score()

    def to_json(self):
        return {
            'time_UNIX': self.time_UNIX,
            'temperature': self.temperature,
            'wind_speed': self.wind_speed,
            'inches_precipitation': self.inches_precipitation,
            'users_available': self.users_available,
            'frisbee_score': self.frisbee_score,
        }

    def calculate_frisbee_score(self):
        aggregate_score = 0.0
        aggregate_score += self.partial_frisbee_score_from_temperature(self.temperature)
        aggregate_score += self.partial_frisbee_score_from_wind_speed(self.wind_speed)
        aggregate_score += self.partial_frisbee_score_from_precipitation(self.inches_precipitation)

        # Modify frisbee score based on user availability
        if len(self.users_available) >= 6:
            aggregate_score *= 1.05 ** (len(self.users_available) - 6)
        else:
            aggregate_score = 0.0

        return aggregate_score

    def __str__(self):
        return f'HourlyForecast(time: {self.time_UNIX}, temperature: {self.temperature}, wind_speed: {self.wind_speed}, inches_precipitation: {self.inches_precipitation}, num_available_users: {self.num_available_users}, frisbee_score: {self.frisbee_score})'

    @staticmethod
    def partial_frisbee_score_from_temperature(temperature):
        score = 100
        bad_temperature = 60 - temperature
        return score - bad_temperature

    @staticmethod
    def partial_frisbee_score_from_wind_speed(wind_speed):
        score = 100
        wind_penalty = 0.75
        return score - (wind_penalty * wind_speed) * (wind_penalty * wind_speed)

    @staticmethod
    def partial_frisbee_score_from_precipitation(inches_precipitation):
        score = 100
        precipitation_penalty = 10
        return score - inches_precipitation * precipitation_penalty


class WeeklyForecast:
    def __init__(self, times, temperatures, precipitation, windspeeds):
        self.hourly_forecasts = []
        self.users_available = self.calculate_num_available_users(self)
        for i in range(len(times)):
            self.hourly_forecasts.append(
                HourlyForecast(dt.utcfromtimestamp(times[i]), temperatures[i], windspeeds[i], precipitation[i],
                               self.users_available))

    def to_json(self):
        return {
            'hourly_forecasts': [forecast.to_json() for forecast in self.hourly_forecasts],
        }

    def get_best_gametime(self):
        max_score = -1
        best_gametime = None
        for hourly_forecast in self.hourly_forecasts:
            if hourly_forecast.frisbee_score > max_score:
                max_score = hourly_forecast.frisbee_score
                best_gametime = hourly_forecast

        return best_gametime

    @classmethod
    def from_json(cls, json_data):
        return cls(
            json_data['hourly']['time'],
            json_data['hourly']['temperature_2m'],
            json_data['hourly']['precipitation'],
            json_data['hourly']['windspeed_10m'],
        )

    @staticmethod
    def calculate_num_available_users(self):
        # Get user availability from Firestore for all users
        user_collection = db.collection('users')
        user_documents = user_collection.stream()

        user_availabilities = {n: [] for n in range(14)}
        for user_document in user_documents:
            user_id = user_document.id
            for available_time in user_document.to_dict().get('availableTime', []):
                user_availabilities[available_time].append(user_id)

        return user_availabilities


def get_weather(lat, long):
    # 42.3551, 71.0657 = Boston Common Coordinates
    url = f'https://api.open-meteo.com/v1/forecast?latitude={lat}&longitude={long}&hourly=temperature_2m,precipitation,windspeed_10m&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch&timeformat=unixtime&timezone=America%2FNew_York'
    response = requests.get(url)
    if response.status_code == 200:
        return WeeklyForecast.from_json(response.json())
    else:
        raise Exception('Failed to fetch weather data')


def get_best_gametime():
    return get_weather(42.3551, -71.0657).get_best_gametime()


def create_game_record(game):
    games_collection_ref = db.collection('games')

    data = {
        "game_is_played": False,
        "gametime_utc": game.time_UNIX,
        "players": [db.collection('users').document(user_doc_id) for user_doc_id in game.users_available],
        "precipitation": game.inches_precipitation,
        "temp": game.temperature,
        "wind": game.wind_speed,
        "time_created": dt.utcnow(),
    }

    new_game_ref = games_collection_ref.add(data)


create_game_record(get_best_gametime())
