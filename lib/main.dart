import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/configs/application.dart';
import 'app/configs/config.dart';
import 'app/pages/app_view.dart';
import 'app/utils/logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final configuredApp = AppConfig(
    apiUrl: Application.domain,
    appName: Application.name,
    flavorName: AppFlavor.dev,
    child: AppView(),
  );
  BlocOverrides.runZoned(
    () => runApp(GestureDetector(
      onTap: () =>
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus(),
      child: configuredApp,
    )),
    blocObserver: AppBlocObserver(),
  );
}

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    UtilLogger.log('BLOC EVENT', event);
    super.onEvent(bloc, event);
  }

  @override
  Future<void> onError(
      BlocBase bloc, Object error, StackTrace stackTrace) async {
    UtilLogger.log('BLOC ERROR', error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    UtilLogger.log('BLOC TRANSITION', transition);
    super.onTransition(bloc, transition);
  }
}
