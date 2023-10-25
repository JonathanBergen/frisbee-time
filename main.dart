// import 'weather_data.dart';

// var frisbee_time_scores = WeatherData.calculateFrisbeeTimeScores();

var player_availability_times = "";

void main() {}

void sendNotificationsForTimeSlot() {}

bool frisbeeHasBeenPlayedThisWeek() {
  return false;
}

DateTime nextSundayMidnight() {
  final date = DateTime.now();
  return DateTime.utc(date.year, date.month, date.day + date.weekday % 7);
}

https://open-meteo.com/en/docs#hourly=temperature_2m,precipitation_probability,windspeed_10m&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch&timeformat=unixtime&timezone=America%2FNew_York