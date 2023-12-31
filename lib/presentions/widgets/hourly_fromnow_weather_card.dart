import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../domain/model/hourly_forecast.dart';
import '../providers/providers.dart';

class HourlyFromNowWeatherCard extends ConsumerWidget {
  final List<HourlyForecast>? _hourlyForecast;
  final int? _hoursFromNow;

  const HourlyFromNowWeatherCard(this._hourlyForecast, this._hoursFromNow,
      {Key? key})
      : super(key: key);

  Expanded _buildHourlyItem(HourlyForecast hourly) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            DateFormat('hh:mm a')
                .format(DateTime.fromMillisecondsSinceEpoch(hourly.dt! * 1000)),
            style: const TextStyle(fontSize: 12.0),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Image.asset(
            'assets/images/icons/${hourly.weather?[0].icon}@2x.png',
            height: 32,
            width: 32,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            "${hourly.temp}°C",
            style: const TextStyle(fontSize: 12.0),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const BoxedIcon(
                WeatherIcons.humidity,
                color: Colors.blueAccent,
                size: 10.0,
              ),
              Text(
                "${hourly.humidity}%",
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeChangeNotifierProvider);
    final _theme = themeProvider.getCurrentTheme();

    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Card(
        elevation: 8.0,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _hourlyForecast!
                .where((hourly) => ((hourly.dt! * 1000) < _hoursFromNow!))
                .map((hourly) => _buildHourlyItem(hourly))
                .toList(),
          ),
        ),
      ),
    );
  }
}
