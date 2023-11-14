import 'weekly_forecast.dart';

void main() async {
  var thisWeek = await GetWeather(42.3551, 71.0657);
  print(thisWeek.hourly_forecasts);
}
