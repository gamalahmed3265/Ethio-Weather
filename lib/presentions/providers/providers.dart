import 'package:ethio_weather/presentions/providers/theme_notifier.dart';
import 'package:ethio_weather/presentions/providers/weather_notifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/weather_repository.dart';
import '../../domain/lat_lng.dart';
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

final userLocationProvider = Provider<LatLng>((ref) {
  throw UnimplementedError();
});

final openWeatherMapRepositoryProvider = Provider<WeatherRepository>((ref) {
  return OpenWeatherMapRepository();
});

final openWeatherMapNotifierProvider =
    StateNotifierProvider<OpenWeatherMapNotifier, OpenWeatherMap>((ref) {
  final userLocation = ref.watch(userLocationProvider);
  final openWeatherMapRepository = ref.watch(openWeatherMapRepositoryProvider);
  return OpenWeatherMapNotifier(openWeatherMapRepository, userLocation);
});
