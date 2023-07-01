import 'dart:ui';

class AppLocale {
  static final AppLocale _appLocale = AppLocale._internal();

  factory AppLocale() {
    return _appLocale;
  }

  AppLocale._internal();

  final List<String> supportedLanguages = [
    "English",
    "العربية",
    "አማርኛ",
    "ትግሪኛ",
    "Afaan Oromoo"
  ];

  final List<String> supportedLanguagesCodes = ["en", "ar", "am", "tg", "or"];

  final Map<String, String> supportedLanguageMap = {
    "en": "English",
    "ar": "العربية",
    "am": "አማርኛ",
    "tg": "ትግሪኛ",
    "or": "Afaan Oromoo",
  };

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback? onLocaleChanged;
}

AppLocale appLocale = AppLocale();

typedef LocaleChangeCallback = void Function(Locale locale);
