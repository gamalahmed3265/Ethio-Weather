import 'package:flutter/cupertino.dart';

import '../../data/data_source/reomte/onecall_api_service.dart';
import '../../domain/model/lat_long.dart';
import '../../domain/model/open_weather_map.dart';

class OneCallWeatherNotifier extends ChangeNotifier {
  OpenWeatherMap? _weather;
  OpenWeatherMap? get weather => _weather;

  final LatLong _latLong;

  OneCallWeatherNotifier(this._latLong) {
    _getWeather(_latLong);
  }

  _getWeather(LatLong latLong) async {
    _weather = await OneCallApiService().fetchWeatherData(latLong);
    notifyListeners();
  }

  reloadWeather() {
    _getWeather(_latLong);
  }
}
