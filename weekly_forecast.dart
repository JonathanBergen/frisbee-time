import 'dart:convert';
import 'hourly_forecast.dart';
import 'package:http/http.dart' as http;

class WeeklyForecast {
  List<HourlyForecast> hourly_forecasts = [];

  WeeklyForecast(List<int> times, List<double> temperatures,
      List<double> precipitation, List<double> windspeeds) {
    var length = times.length;
    for (var i = 0; i < length; i++) {
      this.hourly_forecasts.add(HourlyForecast(
          times[i], temperatures[i], windspeeds[i], precipitation[i]));
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'hourly_forecasts':
          hourly_forecasts.map((forecast) => forecast.toJson()).toList(),
    };
  }

  factory WeeklyForecast.fromJson(Map<String, dynamic> json) {
    return WeeklyForecast(
      (json['hourly']['time'] as List<dynamic>).cast<int>(),
      (json['hourly']['temperature_2m'] as List<dynamic>).cast<double>(),
      (json['hourly']['precipitation'] as List<dynamic>).cast<double>(),
      (json['hourly']['windspeed_10m'] as List<dynamic>).cast<double>(),
    );
  }
}

Future<WeeklyForecast> GetWeather(lat, long) async {
  // 42.3551, 71.0657 = Boston Common Coordinates
  final response = await http.get(Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&hourly=temperature_2m,precipitation,windspeed_10m&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch&timeformat=unixtime&timezone=America%2FNew_York'));
  if (response.statusCode == 200) {
    return WeeklyForecast.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to fetch weather data');
  }
}
