import '../utils/epoch_converter.dart';
import 'city.dart';

class Forecast {
  final City city;
  final List<DailyForecast> list;

  Forecast({
    required this.city,
    required this.list,
  });
}

class DailyForecast {
  final String date;
  final String weekDay;
  final String sunrise;
  final String sunset;
  final Temp temp;
  final int humidity;
  final int pressure;
  final int windSpeed;
  final Weather weather;

  DailyForecast({
    required this.date,
    required this.weekDay,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.weather,
  });

  static DailyForecast fromMap(final Map<String, dynamic> map, final int timezone) => DailyForecast(
        date: EpochConverter.convertToDate((map['dt'] + timezone) * 1000),
        weekDay: EpochConverter.convertToWeekday((map['dt'] + timezone) * 1000),
        sunrise: EpochConverter.convertToTime((map['sunrise'] + timezone) * 1000),
        sunset: EpochConverter.convertToTime((map['sunset'] + timezone) * 1000),
        temp: Temp(
          day: map['temp']['day'].round(),
          min: map['temp']['min'].round(),
          max: map['temp']['max'].round(),
        ),
        humidity: map['humidity'],
        pressure: map['pressure'],
        windSpeed: map['speed'].round(),
        weather: Weather(
          main: map['weather'][0]['main'],
          description: map['weather'][0]['description'],
          icon: map['weather'][0]['icon'],
        ),
      );
}

class Temp {
  final int day;
  final int min;
  final int max;

  Temp({
    required this.day,
    required this.min,
    required this.max,
  });
}

class Weather {
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });
}
