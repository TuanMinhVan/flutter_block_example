import '../../blocs/app_bloc.dart';
import '../../blocs/theme/bloc.dart';
import '../../configs/config.dart';
import '../../configs/language.dart';
import '../../configs/theme.dart';
import '../../utils/language.dart';
import '../../utils/theme.dart';
import '../../widgets/app_list_title.dart';
import '../../widgets/widget.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  DarkOption darkOption = AppTheme.darkThemeOption;
  void onChangeDarkOption() {
    AppBloc.themeBloc.add(OnChangeTheme(darkOption: darkOption));
  }

  Future<void> showDarkModeSetting() async {
    setState(() {
      darkOption = AppTheme.darkThemeOption;
    });
    final result = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(context.tr('dark_mode')),
              const Spacer(),
              const CloseButton()
            ],
          ),
          content: StatefulBuilder(
            builder: (_, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                      activeColor: context.primaryColor,
                      title: Text(
                        context.tr(
                          UtilTheme.exportLangTheme(DarkOption.dynamic),
                        ),
                      ),
                      value: darkOption == DarkOption.dynamic,
                      onChanged: (bool? value) {
                        setState(() {
                          darkOption = DarkOption.dynamic;
                        });
                      },
                    ),
                    CheckboxListTile(
                      activeColor: context.primaryColor,
                      title: Text(
                        context.tr(
                          UtilTheme.exportLangTheme(DarkOption.alwaysOn),
                        ),
                      ),
                      value: darkOption == DarkOption.alwaysOn,
                      onChanged: (bool? value) {
                        setState(() {
                          darkOption = DarkOption.alwaysOn;
                        });
                      },
                    ),
                    CheckboxListTile(
                      activeColor: context.primaryColor,
                      title: Text(
                        context.tr(
                          UtilTheme.exportLangTheme(DarkOption.alwaysOff),
                        ),
                      ),
                      value: darkOption == DarkOption.alwaysOff,
                      onChanged: (bool? value) {
                        setState(() {
                          darkOption = DarkOption.alwaysOff;
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            AppButton(
              context.tr('apply'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
    if (result != null && result) {
      onChangeDarkOption();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(context.tr('setting')),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            AppListTitle(
              icon: const Icon(Icons.language_outlined),
              title: context.tr('language'),
              onPressed: () {
                Routes.pushNamed(Routes.langSetting);
              },
              trailing: Row(
                children: <Widget>[
                  Text(
                    UtilLanguage.getGlobalLanguageName(
                      AppLanguage.defaultLanguage.languageCode,
                    ),
                    style: context.caption,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
            AppListTitle(
              icon: const Icon(Icons.color_lens_outlined),
              title: context.tr('theme'),
              trailing: VxBox()
                  .color(context.primaryColor)
                  .make()
                  .w(24)
                  .h(24)
                  .pOnly(right: 5),
              onPressed: () {
                Routes.pushNamed(Routes.themeSetting);
              },
            ),
            AppListTitle(
              onPressed: showDarkModeSetting,
              icon: const Icon(Icons.nights_stay_outlined),
              title: context.tr('dark_mode'),
              trailing: Row(
                children: [
                  Text(
                    context.tr(
                      UtilTheme.exportLangTheme(AppTheme.darkThemeOption),
                    ),
                    style: context.caption,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    textDirection: TextDirection.ltr,
                  )
                ],
              ),
            ),
            AppListTitle(
              icon: const Icon(Icons.font_download_outlined),
              title: context.tr('font'),
              onPressed: () {
                Routes.pushNamed(Routes.fontSetting);
              },
              trailing: Row(
                children: <Widget>[
                  Text(
                    AppTheme.currentFont,
                    style: context.caption,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    textDirection: TextDirection.ltr,
                  )
                ],
              ),
            ),
            AppListTitle(
              icon: const Icon(Icons.logout),
              title: context.tr('sign_out'),
              onPressed: () {
                Routes.pushNamedAndRemoveUntil(Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
