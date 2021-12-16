import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app/configs/config.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key, required this.controller})
      : super(key: key);
  final TabController controller;
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        currentIndex = index;
        widget.controller.animateTo(index);
        setState(() {});
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: context.primaryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.tr('home'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.near_me),
          label: 'Near By',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesomeIcons.cog),
          label: context.tr('setting'),
        ),
      ],
    );
  }
}
