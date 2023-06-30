import 'package:ethio_weather/presentions/providers/theme_notifier.dart';
import 'package:ethio_weather/presentions/providers/weather_notifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/remote_data_source.dart';
import '../../domain/model/open_weather_map.dart';
import 'connection_notifier.dart';

final themeChangeNotifierProvider = ChangeNotifierProvider((ref) {
  return ThemeNotifier();
});

final hasInternetConnectionProvider = Provider<bool>((ref) {
  throw UnimplementedError();
});

// Provider definition - connection listener
final connectionStateProvider =
    StateNotifierProvider<ConnectionNotifier, bool>((ref) {
  final hasInternetConnection = ref.watch(hasInternetConnectionProvider);
  return ConnectionNotifier(hasInternetConnection);
});

final openWeatherMapRepositoryProvider = Provider<WeatherRepository>(
  (ref) => OpenWeatherMapRepository(),
);

final openWeatherMapNotifierProvider =
    StateNotifierProvider<OpenWeatherMapNotifier, OpenWeatherMap>((ref) {
  return OpenWeatherMapNotifier(ref.watch(openWeatherMapRepositoryProvider));
});
