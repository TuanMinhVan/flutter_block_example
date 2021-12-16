import 'package:flutter/material.dart';
import '../data/models/model_theme.dart';

import 'theme_collection.dart';

enum DarkOption { dynamic, alwaysOn, alwaysOff }

class AppTheme {
  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
  static final AppTheme _instance = AppTheme._internal();

  static const Color blueColor = Color.fromRGBO(93, 173, 226, 1);
  static const Color pinkColor = Color.fromRGBO(165, 105, 189, 1);
  static const Color greenColor = Color.fromRGBO(88, 214, 141, 1);
  static const Color yellowColor = Color.fromRGBO(253, 198, 10, 1);

  static String currentFont = 'ProximaNova';
  static List<String> fontSupport = <String>[
    'OpenSans',
    'ProximaNova',
    'Raleway',
    'Roboto',
    'Merriweather',
  ];

  static ThemeModel currentTheme = ThemeModel.fromJson(<String, dynamic>{
    'name': 'default',
    'color': const Color(0xfff4a261),
    'light': 'defaultLight',
    'dark': 'defaultDark',
  });

  static List<ThemeModel> themeSupport = <dynamic>[
    <String, dynamic>{
      'name': 'default',
      'color': const Color(0xfff4a261),
      'light': 'defaultLight',
      'dark': 'defaultDark',
    },
    <String, dynamic>{
      'name': 'green',
      'color': const Color(0xff82B541),
      'light': 'greenLight',
      'dark': 'greenDark',
    },
  ].map((dynamic item) => ThemeModel.fromJson(item)).toList();

  static DarkOption darkThemeOption = DarkOption.dynamic;

  static ThemeData lightTheme = CollectionTheme.getCollectionTheme(
    theme: currentTheme.lightTheme,
  );

  static ThemeData darkTheme = CollectionTheme.getCollectionTheme(
    theme: currentTheme.darkTheme,
  );
}
