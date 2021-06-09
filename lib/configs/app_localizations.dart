import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:florist/models/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String ENGLISH = 'en';
const String ZH = 'zh';
const String ZH_CN = 'zh_CN';

const String LANGUAGE_CODE = 'language_code';

Future<Locale> setLocale(Language language) async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LANGUAGE_CODE, language.code);
  await _prefs.setString('language_name', language.name);

  return _locale(language.code);
}

Locale _locale(String languageCode){
  Locale _temp;
  switch (languageCode) {
    case ZH:
      _temp = Locale(languageCode);
      break;
    case ENGLISH:
      _temp = Locale(languageCode);
      break;
    case ZH_CN:
      _temp = Locale('zh', 'CN');
      break;
    default:
      _temp = Locale(ZH);
  }
  return _temp;
}

Future<Locale> getLocale() async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.get(LANGUAGE_CODE)??ZH;
  return _locale(languageCode);

}


class AppLocalizations {

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  final Locale locale;

  Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Future<bool> load() async {
    String languageCode = 'assets/lang/${locale.languageCode}.json';
    if (locale.countryCode != null) {
      languageCode =
          'assets/lang/${locale.languageCode}_${locale.countryCode}.json';
    }
    String jsonString = await rootBundle.loadString(languageCode);
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }

  static String t(BuildContext context, String key) {
    return AppLocalizations.of(context).translate(key);
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
