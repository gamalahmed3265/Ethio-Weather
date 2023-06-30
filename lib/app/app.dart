import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/locales/app_locale.dart';
import '../domain/locales/app_localizations_delegate.dart';
import '../presentions/providers/providers.dart';
import '../presentions/resource/router.dart';
import '../presentions/utils/lang_util.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EthioWeatherApp extends ConsumerStatefulWidget {
  const EthioWeatherApp({Key? key}) : super(key: key);

  @override
  ConsumerState<EthioWeatherApp> createState() => _EthioWeatherAppState();
}

class _EthioWeatherAppState extends ConsumerState<EthioWeatherApp> {
  late AppLocalizationsDelegate _newLocaleDelegate;

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppLocalizationsDelegate(newLocale: locale);
    });
  }

  @override
  void initState() {
    super.initState();

    _newLocaleDelegate = const AppLocalizationsDelegate(newLocale: null);
    appLocale.onLocaleChanged = onLocaleChange;

    LangUtil.getCurrentLanguage().then((locale) {
      onLocaleChange(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeChangeNotifierProvider);
    final _theme = themeProvider.getCurrentTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ethio Weather",
      theme: _theme,
      localizationsDelegates: [
        _newLocaleDelegate,
        // A class which loads the translations from JSON files
        const AppLocalizationsDelegate(),
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: appLocale.supportedLocales(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: homePageRoute,
    );
  }
}
