library config;

import 'dart:async';

import 'package:flutter/material.dart';
import '../pages/detail_view.dart';
import '../pages/login_view.dart';
import '../pages/order_view.dart';
import '../pages/register_view.dart';
import '../pages/setting/setting.dart';
import '../pages/home_view.dart';
import '../utils/translate.dart';
export 'package:velocity_x/velocity_x.dart';
export 'package:flutter/material.dart';
part 'extensions/context_extension.dart';
part 'constants/dimens.dart';
part 'constants/image.dart';
part 'constants/string.dart';
part 'extensions/translate_extension.dart';
part 'routes.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    Key? key,
    required this.apiUrl,
    required this.appName,
    required this.flavorName,
    required Widget child,
  }) : super(key: key, child: child) {
    _globalKey = child.key as GlobalKey;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (isDev) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      }
    };
  }

  final String apiUrl, appName;
  final AppFlavor flavorName;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey? _globalKey;
  static GlobalKey get globalKey => _globalKey!;

  bool get isDev => flavorName == AppFlavor.dev;

  AppConfig copyWith({
    String? appName,
    AppFlavor? flavorName,
    String? apiUrl,
    Widget? child,
  }) {
    return AppConfig(
      apiUrl: apiUrl ?? this.apiUrl,
      appName: appName ?? this.appName,
      flavorName: flavorName ?? this.flavorName,
      child: child ?? this.child,
    );
  }

  static AppConfig get instance => _globalKey!.currentContext!
      .dependOnInheritedWidgetOfExactType(aspect: AppConfig)!;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

enum AppFlavor { dev, tes, prod }
