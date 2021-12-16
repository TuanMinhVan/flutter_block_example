import '../../configs/theme.dart';
import '../../data/models/model_theme.dart';

abstract class ThemeEvent {}

class OnChangeTheme extends ThemeEvent {
  OnChangeTheme({
    this.theme,
    this.font,
    this.darkOption,
  });
  final ThemeModel? theme;
  final String? font;
  final DarkOption? darkOption;
}
