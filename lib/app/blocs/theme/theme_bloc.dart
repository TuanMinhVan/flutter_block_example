import 'package:bloc/bloc.dart';
import '../../configs/config.dart';
import '../../configs/theme.dart';
import '../../configs/theme_collection.dart';
import '../../utils/preferences.dart';

import 'bloc.dart';

const String darkDynamic = 'dynamic';
const String darkAlwaysOff = 'off';
const String darkAlwaysOn = 'on';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(InitialThemeState()) {
    on<OnChangeTheme>((event, emit) => mapEventToState(event, emit));
  }

  void mapEventToState(OnChangeTheme event, Emitter<ThemeState> emit) {
    emit(ThemeUpdating());
    AppTheme.currentTheme = event.theme ?? AppTheme.currentTheme;
    AppTheme.currentFont = event.font ?? AppTheme.currentFont;
    AppTheme.darkThemeOption = event.darkOption ?? AppTheme.darkThemeOption;

    ///Setup Theme with setting darkOption
    switch (AppTheme.darkThemeOption) {
      case DarkOption.dynamic:
        AppTheme.lightTheme = CollectionTheme.getCollectionTheme(
          theme: AppTheme.currentTheme.lightTheme,
          font: AppTheme.currentFont,
        );
        AppTheme.darkTheme = CollectionTheme.getCollectionTheme(
          theme: AppTheme.currentTheme.darkTheme,
          font: AppTheme.currentFont,
        );
        break;
      case DarkOption.alwaysOn:
        AppTheme.lightTheme = CollectionTheme.getCollectionTheme(
          theme: AppTheme.currentTheme.darkTheme,
          font: AppTheme.currentFont,
        );
        AppTheme.darkTheme = CollectionTheme.getCollectionTheme(
          theme: AppTheme.currentTheme.darkTheme,
          font: AppTheme.currentFont,
        );
        break;
      case DarkOption.alwaysOff:
        AppTheme.lightTheme = CollectionTheme.getCollectionTheme(
          theme: AppTheme.currentTheme.lightTheme,
          font: AppTheme.currentFont,
        );
        AppTheme.darkTheme = CollectionTheme.getCollectionTheme(
          theme: AppTheme.currentTheme.lightTheme,
          font: AppTheme.currentFont,
        );
        break;
      default:
        AppTheme.lightTheme = CollectionTheme.getCollectionTheme(
          theme: AppTheme.currentTheme.lightTheme,
          font: AppTheme.currentFont,
        );
        AppTheme.darkTheme = CollectionTheme.getCollectionTheme(
          theme: AppTheme.currentTheme.darkTheme,
          font: AppTheme.currentFont,
        );
        break;
    }

    ///Preference save
    UtilPreferences.setString(StringUtils.theme, AppTheme.currentTheme.name);

    ///Preference save
    UtilPreferences.setString(StringUtils.font, AppTheme.currentFont);

    ///Preference save
    switch (AppTheme.darkThemeOption) {
      case DarkOption.dynamic:
        UtilPreferences.setString(StringUtils.darkOption, darkDynamic);
        break;
      case DarkOption.alwaysOn:
        UtilPreferences.setString(StringUtils.darkOption, darkAlwaysOn);
        break;
      case DarkOption.alwaysOff:
        UtilPreferences.setString(StringUtils.darkOption, darkAlwaysOff);
        break;
      default:
        break;
    }

    emit(ThemeUpdated());
  }
}
