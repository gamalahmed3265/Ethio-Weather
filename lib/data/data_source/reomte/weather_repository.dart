import 'dart:convert';

import 'package:http/http.dart' show get;

import '../../../domain/model/open_weather_map.dart';

abstract class WeatherRepository {
  Future<OpenWeatherMap> fetchWeatherData(String url);
}

class OpenWeatherMapRepository implements WeatherRepository {
  @override
  Future<OpenWeatherMap> fetchWeatherData(String url) async {
    var httpsOneCallUri = Uri.parse(url);
    final response =
        await get(httpsOneCallUri, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return OpenWeatherMap.fromJson(jsonData);
    }
    throw Exception('Failed to Open Weather data');
  }
}
