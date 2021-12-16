import 'package:flutter/material.dart';

class AppLanguage {
  factory AppLanguage() {
    return _instance;
  }

  AppLanguage._internal();
  static final AppLanguage _instance = AppLanguage._internal();
  static Locale defaultLanguage = const Locale('en');

  static List<Locale> supportLanguage = const <Locale>[
    Locale('en'),
    Locale('vi'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('fr'),
    Locale('id'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('zh'),
    Locale('ru'),
  ];
}
