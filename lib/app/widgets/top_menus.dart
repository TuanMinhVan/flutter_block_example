import '../configs/theme.dart';
import '../../app/configs/config.dart';

class TopMenus extends StatefulWidget {
  const TopMenus({Key? key}) : super(key: key);
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          TopMenuTiles(name: 'Burger', imageUrl: 'ic_burger', slug: ''),
          TopMenuTiles(name: 'Sushi', imageUrl: 'ic_sushi', slug: ''),
          TopMenuTiles(name: 'Pizza', imageUrl: 'ic_pizza', slug: ''),
          TopMenuTiles(name: 'Cake', imageUrl: 'ic_cake', slug: ''),
          TopMenuTiles(name: 'Ice Cream', imageUrl: 'ic_ice_cream', slug: ''),
          TopMenuTiles(name: 'Soft Drink', imageUrl: 'ic_soft_drink', slug: ''),
          TopMenuTiles(name: 'Burger', imageUrl: 'ic_burger', slug: ''),
          TopMenuTiles(name: 'Sushi', imageUrl: 'ic_sushi', slug: ''),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  const TopMenuTiles({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.slug,
  }) : super(key: key);
  final String name;
  final String imageUrl;
  final String slug;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Image.asset(
        'assets/images/topmenu/' + imageUrl + '.png',
        width: 24,
        height: 24,
      )
          .box
          .makeCentered()
          .w(50)
          .h(50)
          .card
          .color(Colors.white)
          .elevation(0)
          .make()
          .box
          .withDecoration(BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppTheme.darkThemeOption == DarkOption.alwaysOn
                  ? Colors.white24
                  : const Color(0xFFfae3e2),
              blurRadius: 25.0,
              offset: const Offset(0.0, 0.75),
            ),
          ]))
          .padding(const EdgeInsets.fromLTRB(10, 5, 5, 5))
          .make(),
      name.text.gray500.make(),
    ].column().onInkTap(() {});
  }
}
