import 'package:flutter/material.dart';

import '../presentions/resource/router.dart';

class EthioWeatherApp extends StatelessWidget {
  const EthioWeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ethio Weather App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: homePageRoute,
    );
  }
}
