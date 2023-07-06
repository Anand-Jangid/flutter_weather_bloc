import 'dart:math';

import 'package:flutter_weather_bloc/data/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);

  Future<Weather> fetchDetailedWeather(String cityName);
}

class FakeWeatherRepository extends WeatherRepository {
  late double cachedTempCelsius;

  @override
  Future<Weather> fetchDetailedWeather(String cityName) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      return Weather(
          cityName: cityName,
          temperatureCelsius: cachedTempCelsius,
          temperatureFarenheit: cachedTempCelsius * 1.8 + 32);
    });
  }

  @override
  Future<Weather> fetchWeather(String cityName) async {

    await Future.delayed(const Duration(seconds: 1));
    final random = Random();

    if (random.nextBool()) {
      throw NetworkError();
    }

    cachedTempCelsius = 20 + random.nextInt(15) + random.nextDouble();
    return Weather(cityName: cityName, temperatureCelsius: cachedTempCelsius);
    
  }
}

class NetworkError extends Error {}
