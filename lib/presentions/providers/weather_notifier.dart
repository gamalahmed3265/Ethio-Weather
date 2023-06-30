import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/config.dart';
import '../../data/data_source/weather_repository.dart';
import '../../domain/lat_lng.dart';
import '../../domain/model/open_weather_map.dart';

class OpenWeatherMapNotifier extends StateNotifier<OpenWeatherMap> {
  final WeatherRepository _weatherRepository;
  final LatLng _userLocation;

  OpenWeatherMapNotifier(this._weatherRepository, this._userLocation)
      : super(OpenWeatherMap()) {
    final apiOneCallUrl = Uri.https(Config.apiBaseUrl, 'data/2.5/onecall', {
      'lat': _userLocation.latitude.toString(),
      'lon': _userLocation.longitude.toString(),
      'appid': Config.appId,
      'units': 'metric',
      'lang': 'en',
    });
    getWeather(apiOneCallUrl.toString());
  }

  getWeather(String url) async {
    final weather = await _weatherRepository.fetchWeatherData(url);
    state = weather;
  }
}
