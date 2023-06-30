import 'package:ethio_weather/presentions/providers/theme_notifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/config.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../domain/model/open_weather_map.dart';

final themeChangeNotifierProvider = ChangeNotifierProvider((ref) {
  return ThemeNotifier();
});

// Provider definition - reference to the whole OpenWeatherMapService()
final openWeatherMapServiceProvider = Provider((ref) {
  return OpenWeatherMapService();
});

// The FutureProvider will access the API and return OpenWeatherMap weather data
final openWeatherMapDataProvider = FutureProvider<OpenWeatherMap>((ref) async {
  return ref
      .read(openWeatherMapServiceProvider)
      .geOneCallWeather(Config.ONECALL_API_ENDPOINT_URL.toString());
});
