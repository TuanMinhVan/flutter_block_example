part of config;

extension TranslateExt on String {
  String gettr(String key) =>
      Translate.of(AppConfig.navigatorKey.currentContext!).translate(this);
}
