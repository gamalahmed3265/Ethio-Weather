import 'package:ethio_weather/presentions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'app/app.dart';
import 'data/data_source/location_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hasInternetConnection = await InternetConnectionChecker().hasConnection;
  final userLocation = await LocationService().getUserCurrentLocation();

  runApp(ProviderScope(
    overrides: [
      // override the previous value with the new object
      hasInternetConnectionProvider.overrideWithValue(hasInternetConnection),
      userLocationProvider.overrideWithValue(userLocation),
    ],
    child: const EthioWeatherApp(),
  ));
}
