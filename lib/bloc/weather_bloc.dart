import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_weather_bloc/data/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository})
      : super(const WeatherInitial()) {
    //Get Weather event
    on<GetWeather>(_getWeather);

    //Get Detail Weather Event
    on<GetDetailWeather>(_getDetailWeather);
  }

  FutureOr<void> _getWeather(
      GetWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoading());
    try {
      final weather = await weatherRepository.fetchWeather(event.cityName);
      emit(WeatherLoaded(weather: weather));
    } on NetworkError {
      emit(const WeatherError(
          message: "Couldn't fetch weather. Is the device online?"));
    } catch (e) {
      emit( WeatherError(
          message: e.toString()));
    }
  }

  FutureOr<void> _getDetailWeather(
      GetDetailWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoading());
    try {
      final weather =
          await weatherRepository.fetchDetailedWeather(event.cityName);
      emit(WeatherLoaded(weather: weather));
    }on NetworkError {
      emit(const WeatherError(
          message: "Couldn't fetch weather. Is the device online?"));
    } catch (e) {
      emit( WeatherError(
          message: e.toString()));
    }
  }
}
