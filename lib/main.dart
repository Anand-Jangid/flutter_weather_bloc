import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bloc/data/weather_repository.dart';
import 'package:flutter_weather_bloc/pages/weather_search_page.dart';
import 'package:flutter_weather_bloc/simple_bloc_observer.dart';

import 'bloc/weather_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: BlocProvider(
        create: (context) =>
            WeatherBloc(weatherRepository: FakeWeatherRepository()),
        child: const WeatherSearchPage(),
      ),
    );
  }
}
