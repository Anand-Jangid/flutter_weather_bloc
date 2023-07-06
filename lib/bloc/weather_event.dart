// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherEvent {
  final String cityName;
  const GetWeather({
    required this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}

class GetDetailWeather extends WeatherEvent {
  final String cityName;
  const GetDetailWeather({
    required this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}
