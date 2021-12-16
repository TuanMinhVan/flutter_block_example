import 'package:flutter_bloc/flutter_bloc.dart';
import '../authentication/bloc.dart';
import '../language/bloc.dart';
import '../theme/bloc.dart';
import '../../configs/application.dart';
import '../../configs/config.dart';
import '../../configs/theme.dart';
import '../../utils/preferences.dart';

import '../app_bloc.dart';
import 'bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final Application application = Application();

  ApplicationBloc() : super(InitialApplicationState()) {
    on<OnSetupApplication>((event, emit) async {
      await application.setPreferences();
      final oldTheme = UtilPreferences.getString(StringUtils.theme);
      final oldFont = UtilPreferences.getString(StringUtils.font);
      final oldLanguage = UtilPreferences.getString(StringUtils.language);
      final oldDarkOption = UtilPreferences.getString(StringUtils.darkOption);

      DarkOption? darkOption;
      if (oldLanguage != null) {
        AppBloc.languageBloc.add(
          OnChangeLanguage(Locale(oldLanguage)),
        );
      }
      final font = AppTheme.fontSupport.firstWhereOrNull((e) => e == oldFont);

      final theme = AppTheme.themeSupport
          .firstWhereOrNull((item) => item.name == oldTheme);

      if (oldDarkOption != null) {
        switch (oldDarkOption) {
          case darkAlwaysOff:
            darkOption = DarkOption.alwaysOff;
            break;
          case darkAlwaysOn:
            darkOption = DarkOption.alwaysOn;
            break;
          default:
            darkOption = DarkOption.dynamic;
        }
      }
      AppBloc.themeBloc.add(
        OnChangeTheme(
          theme: theme,
          font: font,
          darkOption: darkOption,
        ),
      );

      AppBloc.authBloc.add(OnAuthCheck());
      emit(ApplicationCompleted());
    });
  }

  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is OnSetupApplication) {
      await application.setPreferences();
      final oldTheme = UtilPreferences.getString(StringUtils.theme);
      final oldFont = UtilPreferences.getString(StringUtils.font);
      final oldLanguage = UtilPreferences.getString(StringUtils.language);
      final oldDarkOption = UtilPreferences.getString(StringUtils.darkOption);

      DarkOption? darkOption;
      if (oldLanguage != null) {
        AppBloc.languageBloc.add(
          OnChangeLanguage(Locale(oldLanguage)),
        );
      }
      final font = AppTheme.fontSupport.firstWhereOrNull((e) => e == oldFont);

      final theme = AppTheme.themeSupport
          .firstWhereOrNull((item) => item.name == oldTheme);

      if (oldDarkOption != null) {
        switch (oldDarkOption) {
          case darkAlwaysOff:
            darkOption = DarkOption.alwaysOff;
            break;
          case darkAlwaysOn:
            darkOption = DarkOption.alwaysOn;
            break;
          default:
            darkOption = DarkOption.dynamic;
        }
      }
      AppBloc.themeBloc.add(
        OnChangeTheme(
          theme: theme,
          font: font,
          darkOption: darkOption,
        ),
      );

      AppBloc.authBloc.add(OnAuthCheck());

      yield ApplicationCompleted();
    }
  }
}

extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
