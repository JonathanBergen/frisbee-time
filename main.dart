import 'dart:convert';
import 'dart:io';
import 'weekly_forecast.dart';

void main() async {
  try {
    final weeklyForecast = await GetWeather(42.3551, 71.0657);

    // Convert WeeklyForecast to a Map
    final jsonData = weeklyForecast.toJson();

    // Convert the Map to a JSON string
    final jsonString = jsonEncode(jsonData);

    // Write the JSON string to a file
    await File('weekly_forecast_data.json').writeAsString(jsonString);

    print('Data written to weekly_forecast_data.json');
  } catch (e) {
    print('Error: $e');
  }
}