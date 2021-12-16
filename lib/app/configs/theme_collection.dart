import 'package:flutter/material.dart';

class CollectionTheme {
  factory CollectionTheme() {
    return _instance;
  }

  CollectionTheme._internal();
  static final CollectionTheme _instance = CollectionTheme._internal();

  static ThemeData getCollectionTheme({
    String theme = 'defaultLight',
    String? font,
  }) {
    late ColorScheme colorScheme;
    switch (theme) {
      case 'defaultLight':
        colorScheme = const ColorScheme.light(
          primary: Color(0xFFfd5352),
          primaryVariant: Color(0xfff4a261),
          secondary: Color(0xff2A9D8F),
          secondaryVariant: Color(0xff264653),
          surface: Color(0xfff2f2f2),
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        );
        break;
      case 'defaultDark':
        colorScheme = const ColorScheme.dark(
          primary: Color(0xFFfd5352),
          primaryVariant: Color(0xfff4a261),
          secondary: Color(0xff2A9D8F),
          secondaryVariant: Color(0xff264653),
          surface: Color(0xff121212),
          background: Color(0xff010101),
          error: Colors.red,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.black,
          brightness: Brightness.dark,
        );
        break;

      case 'greenLight':
        colorScheme = const ColorScheme.light(
          primary: Color(0xff82B541),
          primaryVariant: Color(0xff51850a),
          secondary: Color(0xffff8a65),
          secondaryVariant: Color(0xffc75b39),
          surface: Color(0xfff2f2f2),
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        );
        break;
      case 'greenDark':
        colorScheme = const ColorScheme.dark(
          primary: Color(0xff82B541),
          primaryVariant: Color(0xff51850a),
          secondary: Color(0xffff8a65),
          secondaryVariant: Color(0xffc75b39),
          surface: Color(0xff121212),
          background: Color(0xff010101),
          error: Colors.red,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.black,
          brightness: Brightness.dark,
        );
        break;
      default:
    }

    final dark = colorScheme.brightness == Brightness.dark;
    final primaryColor = dark ? colorScheme.surface : colorScheme.primary;
    final appBarColor = dark ? colorScheme.surface : colorScheme.background;
    final indicatorColor = dark ? colorScheme.onSurface : colorScheme.primary;
    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      primaryColorBrightness: ThemeData.estimateBrightnessForColor(
        primaryColor,
      ),
      appBarTheme: AppBarTheme(
        color: appBarColor,
        iconTheme: IconThemeData(color: colorScheme.onBackground),
        titleTextStyle: ThemeData.dark().textTheme.headline6!.copyWith(
              color: colorScheme.onBackground,
              fontSize: 20,
            ),
      ),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.surface,
      errorColor: colorScheme.error,
      indicatorColor: indicatorColor,
      applyElevationOverlayColor: dark,
      colorScheme: colorScheme,
      fontFamily: font,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
