import 'package:shared_preferences/shared_preferences.dart';

class Application {
  factory Application() {
    return _instance;
  }

  Application._internal();
  static final Application _instance = Application._internal();

  static bool debug = true;
  static String version = '1.0.0';
  static String dateFormat = 'HH:MM, MMM dd yyyy';
  static String domain = 'http://jsonplaceholder.typicode.com';
  static String name = 'demoapp';
  static late SharedPreferences preferences;

  Future<void> setPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }
}
