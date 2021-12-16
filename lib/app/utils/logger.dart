import 'dart:developer' as developer;

import '../configs/application.dart';

class UtilLogger {
  factory UtilLogger() {
    return _instance;
  }

  UtilLogger._internal();
  static final UtilLogger _instance = UtilLogger._internal();
  static const String tag = 'App';

  static void log([String tag = tag, dynamic msg]) {
    if (Application.debug) {
      developer.log('$msg', name: tag);
    }
  }
}
