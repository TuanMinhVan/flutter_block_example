part of config;
class StringUtils {
  factory StringUtils() {
    return _instance;
  }

  StringUtils._internal();
  static final StringUtils _instance = StringUtils._internal();

  static String cleanUp = 'cleanUp';
  static String localTimeZone = 'localTimeZone';
  static String language = 'language';
  static String theme = 'theme';
  static String darkOption = 'darkOption';
  static String font = 'font';
}
