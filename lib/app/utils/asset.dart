import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class UtilAsset {
  factory UtilAsset() {
    return _instance;
  }

  UtilAsset._internal();
  static final UtilAsset _instance = UtilAsset._internal();
  static Future<Map<String, dynamic>> loadJson(String path) async {
    final content = await rootBundle.loadString(path);
    return jsonDecode(content);
  }
}
