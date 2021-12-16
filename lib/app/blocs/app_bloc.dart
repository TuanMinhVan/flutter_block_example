import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/bloc.dart';
import 'authentication/bloc.dart';
import 'language/bloc.dart';
import 'theme/bloc.dart';

class AppBloc {
  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
  static final AppBloc _instance = AppBloc._internal();
  static final AuthBloc authBloc = AuthBloc();
  static final LanguageBloc languageBloc = LanguageBloc();
  static final ApplicationBloc applicationBloc = ApplicationBloc();
  static final ThemeBloc themeBloc = ThemeBloc();

  static final List<BlocProvider<dynamic>> providers = <BlocProvider<dynamic>>[
    BlocProvider<ApplicationBloc>(create: (_) => applicationBloc),
    BlocProvider<LanguageBloc>(create: (_) => languageBloc),
    BlocProvider<AuthBloc>(create: (_) => authBloc),
    BlocProvider<ThemeBloc>(create: (_) => themeBloc),
  ];
  static void dispose() {
    authBloc.close();
    languageBloc.close();
    applicationBloc.close();
    themeBloc.close();
  }
}
