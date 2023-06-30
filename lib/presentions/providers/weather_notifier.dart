import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/config.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../domain/model/open_weather_map.dart';

class OpenWeatherMapNotifier extends StateNotifier<OpenWeatherMap> {
  final WeatherRepository _weatherRepository;

  OpenWeatherMapNotifier(this._weatherRepository) : super(OpenWeatherMap()) {
    getWeather(Config.apiOneCallUrl.toString());
  }

  getWeather(String url) async {
    final weather = await _weatherRepository.fetchWeatherData(url);
    state = weather;
  }
}
