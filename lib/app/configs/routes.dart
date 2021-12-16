part of config;

class Routes {
  factory Routes() {
    return _instance;
  }

  Routes._internal();
  static final Routes _instance = Routes._internal();
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String detail = '/detail';
  static const String order = '/order';
  static const String fontSetting = '/font_setting';
  static const String langSetting = '/lang_setting';
  static const String themeSetting = '/theme_setting';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _generateRoute(const HomeView());
      case login:
        return _generateRoute(const LoginView());
      case register:
        return _generateRoute(const RegisterView());
      case detail:
        return _generateRoute(DetailView(image: settings.arguments as String));
      case order:
        return _generateRoute(const OrderView());
      case fontSetting:
        return _generateRoute(const FontSetting());
      case langSetting:
        return _generateRoute(const LanguagesScreen());
      case themeSetting:
        return _generateRoute(const ThemeSetting());
      default:
        return onUnknownRoute(settings);
    }
  }

  static void pushNamed(String router, {dynamic arguments}) {
    Navigator.of(
      AppConfig.navigatorKey.currentContext!,
    ).pushNamed(router, arguments: arguments);
  }

  static void pushNamedAndRemoveUntil(String router, {dynamic arguments}) {
    Navigator.of(
      AppConfig.navigatorKey.currentContext!,
    ).pushNamedAndRemoveUntil(router, (route) => false);
  }
}

dynamic _generateRoute(Widget screen, {RouteSettings? settings}) {
  return MaterialPageRoute(builder: (context) => screen, settings: settings);
}

Route onUnknownRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text(
          settings.name!.split('/')[1],
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w900, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('${settings.name!.split('/')[1]} Coming soon..'),
      ),
    ),
  );
}
