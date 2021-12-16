import '../../blocs/app_bloc.dart';
import '../../blocs/theme/bloc.dart';
import '../../configs/config.dart';
import '../../configs/theme.dart';
import '../../widgets/app_list_title.dart';
import '../../widgets/widget.dart';

class FontSetting extends StatefulWidget {
  const FontSetting({Key? key}) : super(key: key);

  @override
  _FontSettingState createState() => _FontSettingState();
}

class _FontSettingState extends State<FontSetting> {
  String currentFont = AppTheme.currentFont;
  @override
  void initState() {
    super.initState();
  }

  Future<void> onChange() async {
    AppBloc.themeBloc.add(OnChangeTheme(font: currentFont));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: const CloseButton(),
        title: context.tr('font').text.make(),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16, top: 8),
                itemCount: AppTheme.fontSupport.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = AppTheme.fontSupport[index];
                  Widget? trailing;
                  if (item == currentFont) {
                    trailing = const Icon(Icons.check);
                  }
                  return AppListTitle(
                    title: item,
                    trailing: trailing,
                    onPressed: () {
                      setState(() {
                        currentFont = item;
                      });
                    },
                  );
                },
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
