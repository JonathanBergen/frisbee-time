import json
import matplotlib.pyplot as plt
from datetime import datetime
import numpy as np

# Load data from a JSON file
with open('weekly_forecast_data.json', 'r') as file:
    data = json.load(file)

# Access the dictionary containing hourly forecasts
hourly_forecasts = data["hourly_forecasts"]

# Group data by day
days_data = {}
for forecast in hourly_forecasts:
    timestamp = forecast["time_UNIX"]
    date = datetime.utcfromtimestamp(timestamp).strftime('%Y-%m-%d')
    if date not in days_data:
        days_data[date] = {"timestamps": [], "temperature": [], "wind_speed": [], "inches_precipitation": [],
                           "frisbee_score": []}
    days_data[date]["timestamps"].append(timestamp)
    days_data[date]["temperature"].append(forecast["temperature"])
    days_data[date]["wind_speed"].append(forecast["wind_speed"])
    days_data[date]["inches_precipitation"].append(forecast["inches_precipitation"])
    days_data[date]["frisbee_score"].append(forecast["frisbee_score"])

# Create one plot for each day
for date, day_data in days_data.items():
    timestamps = day_data["timestamps"]
    plt.figure(figsize=(10, 6))
    plt.plot(day_data["timestamps"], day_data["temperature"], label="Temperature", marker='o')
    plt.plot(day_data["timestamps"], day_data["wind_speed"], label="Wind Speed", marker='o')
    plt.plot(day_data["timestamps"], day_data["inches_precipitation"], label="Inches of Precipitation", marker='o')
    plt.plot(day_data["timestamps"], day_data["frisbee_score"], label="Frisbee Score", marker='o')

    plt.title(f"Weather Data - {date}")
    plt.xlabel("Timestamp")
    plt.ylabel("Values")
    plt.legend()
    plt.xticks(timestamps, [datetime.utcfromtimestamp(ts).strftime('%I:%M %p') for ts in timestamps], rotation=45,
               ha='right')
    plt.grid(True)
    plt.show()
