import '../widgets/widget.dart';

import '../configs/config.dart';

import 'setting/setting_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            controller: controller,
            children: [
              const _HomeView(),
              Container(),
              Container(),
              const SettingView(),
            ],
          ),
          bottomNavigationBar: BottomNavBarWidget(controller: controller),
        ));
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: 'What would you like to eat?'
            .text
            .size(16)
            .align(TextAlign.left)
            .make(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black87,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: const <Widget>[
        SearchWidget(),
        TopMenus(),
        PopularWidget(),
        BestWidget(),
      ].column().scrollVertical(),
    );
  }
}
