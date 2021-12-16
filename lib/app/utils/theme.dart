import '../configs/theme.dart';

class UtilTheme {
  ///Singleton factory

  factory UtilTheme() {
    return _instance;
  }

  UtilTheme._internal();
  static final UtilTheme _instance = UtilTheme._internal();
  static String exportLangTheme(DarkOption option) {
    switch (option) {
      case DarkOption.dynamic:
        return 'dynamic_theme';
      case DarkOption.alwaysOff:
        return 'always_off';
      default:
        return 'always_on';
    }
  }
}
