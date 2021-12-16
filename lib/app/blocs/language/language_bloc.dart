import 'package:bloc/bloc.dart';
import '../../configs/config.dart';
import '../../configs/language.dart';
import '../../utils/preferences.dart';

import 'bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(InitialLanguageState()) {
    on<OnChangeLanguage>((event, emit) {
      if (event.locale == AppLanguage.defaultLanguage) {
        emit(LanguageUpdated());
      } else {
        emit(LanguageUpdating());
        AppLanguage.defaultLanguage = event.locale;
        UtilPreferences.setString(
          StringUtils.language,
          event.locale.languageCode,
        );

        emit(LanguageUpdated());
      }
    });
  }
}
