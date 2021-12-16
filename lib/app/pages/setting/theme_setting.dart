import '../../widgets/widget.dart';
import '../../blocs/app_bloc.dart';
import '../../blocs/theme/bloc.dart';
import '../../configs/config.dart';
import '../../configs/theme.dart';
import '../../data/models/model_theme.dart';

class ThemeSetting extends StatefulWidget {
  const ThemeSetting({Key? key}) : super(key: key);

  @override
  _ThemeSettingState createState() {
    return _ThemeSettingState();
  }
}

class _ThemeSettingState extends State<ThemeSetting> {
  ThemeModel currentTheme = AppTheme.currentTheme;

  ///On Change Theme
  void onChange() {
    AppBloc.themeBloc.add(OnChangeTheme(theme: currentTheme));
  }

  @override
  Widget build(BuildContext context) {
    final border = BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1, color: context.dividerColor),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        elevation: 0,
        centerTitle: true,
        title: context.tr('theme').text.make(),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                itemBuilder: (_, int index) {
                  Widget selected = Container();
                  final item = AppTheme.themeSupport[index];
                  if (item.name == currentTheme.name) {
                    selected = Icon(
                      Icons.check,
                      color: context.primaryColor,
                    );
                  }
                  return <Widget>[
                    <Widget>[
                      VxBox()
                          .color(item.color)
                          .make()
                          .w(24)
                          .h(24)
                          .pOnly(right: 5),
                      Text(
                        context.tr(item.name),
                        style: context.subtitle2,
                      )
                    ].row(),
                    const Spacer(),
                    selected,
                  ]
                      .row()
                      .box
                      .withDecoration(border)
                      .padding(const EdgeInsets.only(top: 16, bottom: 16))
                      .make()
                      .onInkTap(() {
                    setState(() {
                      currentTheme = item;
                    });
                  });
                },
                itemCount: AppTheme.themeSupport.length,
              ),
            ),
            AppButton(
              context.tr('apply'),
              onPressed: onChange,
            ).p(16)
          ],
        ),
      ),
    );
  }
}
