import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../app/blocs/app_bloc.dart';
import '../../app/blocs/application/bloc.dart';
import '../../app/blocs/authentication/bloc.dart';
import '../../app/blocs/language/bloc.dart';
import '../../app/blocs/theme/bloc.dart';
import '../../app/configs/config.dart';
import '../../app/configs/language.dart';
import '../../app/configs/theme.dart';
import '../../app/pages/home_view.dart';
import '../../app/pages/login_view.dart';
import '../../app/pages/splash_view.dart';
import '../../app/utils/translate.dart';

class AppView extends StatefulWidget {
  AppView({Key? key}) : super(key: key ?? GlobalKey());

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    AppBloc.applicationBloc.add(OnSetupApplication());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (BuildContext context, LanguageState lang) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (BuildContext context, ThemeState theme) {
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (BuildContext context, AuthState auth) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    navigatorKey: AppConfig.navigatorKey,
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.darkTheme,
                    onGenerateRoute: Routes.generateRoute,
                    locale: AppLanguage.defaultLanguage,
                    localizationsDelegates: const <
                        LocalizationsDelegate<dynamic>>[
                      Translate.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: AppLanguage.supportLanguage,
                    home: BlocBuilder<ApplicationBloc, ApplicationState>(
                      builder:
                          (BuildContext context, ApplicationState application) {
                        if (application is ApplicationCompleted) {
                          if (auth is AuthenticationFail) {
                            return const LoginView();
                          }
                          if (auth is AuthenticationSuccess) {
                            return const HomeView();
                          }
                        }
                        return const SplashView();
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
