import 'package:dio/dio.dart';

import '../../../app/config.dart';
import '../../../domain/model/lat_long.dart';
import '../../../domain/model/open_weather_map.dart';
import 'dio_client.dart';

class OneCallApiService {
  final _apiOneCall = DioClient.create();

  Future<OpenWeatherMap> fetchWeatherData(LatLong latLong) async {
    try {
      Options _options = Options(
        headers: {"Content-Type": "application/json"},
      );

      Response response = await _apiOneCall.get('/data/2.5/onecall',
          queryParameters: {
            'lat': latLong.latitude.toString(),
            'lon': latLong.longitude.toString(),
            'appid': Config.appId,
            'units': 'metric',
            'lang': 'en'
          },
          options: _options);

      if (response.statusCode == 200) {
        return OpenWeatherMap.fromJson(response.data);
      }
      return Future.error('Failed to Open Weather data');
    } on DioError {
      throw Exception("DioError: Failed to Open Weather data");
    }
  }
}
