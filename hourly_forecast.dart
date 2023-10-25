class HourlyForecast {
    final int time_UNIX;
    var temperature;
    var wind_speed;
    var inches_precipitation;
    var frisbee_score;

    HourlyForecast(this.time_UNIX, this.temperature, this.wind_speed, this.inches_precipitation) {
        this.frisbee_score = calculateFrisbeeScore();
    }

    double calculateFrisbeeScore() {
        return 4.5;
    }
}