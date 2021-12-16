part of config;
class ImageConstants {
  factory ImageConstants() {
    return _instance;
  }

  ImageConstants._internal();
  static final ImageConstants _instance = ImageConstants._internal();
  static const String logo = 'assets/images/menus/ic_food_express.png';
}
