import '../../blocs/app_bloc.dart';
import '../../blocs/language/bloc.dart';
import '../../configs/config.dart';
import '../../configs/language.dart';
import '../../utils/language.dart';
import '../../widgets/app_list_title.dart';
import '../../widgets/widget.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  List<Locale> listLanguage = AppLanguage.supportLanguage;
  Locale languageSelected = AppLanguage.defaultLanguage;

  void changeLanguage() {
    AppBloc.languageBloc.add(OnChangeLanguage(languageSelected));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: context.tr('language').text.make(),
        leading: const CloseButton(),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: listLanguage.length,
              padding: const EdgeInsets.only(left: 16),
              itemBuilder: (BuildContext context, int index) {
                Widget? trailing;
                final item = listLanguage[index];
                if (item == languageSelected) {
                  trailing = Icon(Icons.check, color: context.primaryColor);
                }
                return AppListTitle(
                  title: UtilLanguage.getGlobalLanguageName(
                    item.languageCode,
                  ),
                  trailing: trailing,
                  onPressed: () {
                    setState(() {
                      languageSelected = item;
                    });
                  },
                );
              },
            ),
          ),
          AppButton(
            context.tr('apply'),
            onPressed: changeLanguage,
          ).p(16)
        ],
      ),
    );
  }
}
