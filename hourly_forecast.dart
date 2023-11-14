class HourlyForecast {
  final int time_UNIX;
  var temperature;
  var wind_speed;
  var inches_precipitation;
  var frisbee_score;

  HourlyForecast(this.time_UNIX, this.temperature, this.wind_speed,
      this.inches_precipitation) {
    this.frisbee_score = calculateFrisbeeScore();
  }

  Map<String, dynamic> toJson() {
    return {
      'time_UNIX': time_UNIX,
      'temperature': temperature,
      'wind_speed': wind_speed,
      'inches_precipitation': inches_precipitation,
      'frisbee_score': frisbee_score,
    };
  }

  double calculateFrisbeeScore() {
    var aggregate_score = 0.0;
    aggregate_score += partialFrisbeeScoreFromTemperature(this.temperature);
    aggregate_score += partialFrisbeeScoreFromWindSpeed(this.wind_speed);
    aggregate_score +=
        partialFrisbeeScoreFromPrecipitation(this.inches_precipitation);
    return aggregate_score;
  }

  @override
  String toString() {
    return 'HourlyForecast(time: $time_UNIX, temperature: $temperature, wind_speed: $wind_speed, inches_precipitation: $inches_precipitation, frisbee_score: $frisbee_score)';
  }

  double partialFrisbeeScoreFromTemperature(double temperature) {
    var score = 100;
    var bad_temperature = 60 - temperature;
    return score - bad_temperature;
  }

  double partialFrisbeeScoreFromWindSpeed(double wind_speed) {
    var score = 100;
    var wind_penalty = 0.75;
    return score - (wind_penalty * wind_speed) * (wind_penalty * wind_speed);
  }

  double partialFrisbeeScoreFromPrecipitation(double inches_precipitation) {
    var score = 100;
    var precipitation_penalty = 10;
    return score - inches_precipitation * precipitation_penalty;
  }
}
