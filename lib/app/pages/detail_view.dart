import '../../app/configs/config.dart';
import '../../app/configs/theme.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.business_center),
                onPressed: () {
                  Routes.pushNamed(Routes.order);
                })
          ],
        ),
        body: <Widget>[
          _ImageWidget(image: image),
          const _FoodTitleWidget(
            productName: 'Grilled Salmon',
            productPrice: '\$96.00',
            productHost: 'pizza hut',
          ),
          Dimens.height15,
          const _AddToCartMenu(),
          Dimens.height15,
          const _TabBar(),
          const _BottomMenu(),
          Dimens.height10,
        ]
            .column()
            .box
            .padding(const EdgeInsets.only(left: 15, right: 15))
            .make()
            .scrollVertical()
            .safeArea(),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .card
        .color(
          AppTheme.darkThemeOption == DarkOption.alwaysOff
              ? context.cardColor
              : Colors.white,
        )
        .elevation(1)
        .shape(Dimens.cardBorder)
        .make();
  }
}

class _FoodTitleWidget extends StatelessWidget {
  const _FoodTitleWidget({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productHost,
  }) : super(key: key);
  final String productName;
  final String productPrice;
  final String productHost;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        productName.text.size(20).blueGray700.medium.make(),
        productPrice.text.size(20).blueGray700.medium.make(),
      ].row(
        alignment: MainAxisAlignment.spaceBetween,
        axisSize: MainAxisSize.max,
      ),
      Dimens.height5,
      <Widget>[
        'by '.text.size(16).gray400.make(),
        productHost.text.size(16).make(),
      ].row(
        axisSize: MainAxisSize.max,
      ),
    ].column();
  }
}

class _AddToCartMenu extends StatelessWidget {
  const _AddToCartMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.remove),
        color: Colors.black,
        iconSize: 30,
      ),
      'Add To Bag'
          .text
          .white
          .size(18)
          .make()
          .box
          .alignment(Alignment.center)
          .withRounded(value: 10)
          .color(context.primaryColor)
          .make()
          .h(45)
          .w(context.width * .6)
          .onInkTap(() {
        Routes.pushNamed(Routes.order);
      }),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
        color: context.primaryColor,
        iconSize: 30,
      )
    ].row(
      axisSize: MainAxisSize.max,
      alignment: MainAxisAlignment.center,
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: TabBar(
          labelColor: context.primaryColor,
          indicatorColor: context.primaryColor,
          unselectedLabelColor: context.onBackground,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Food Details'),
            Tab(text: 'Food Reviews'),
          ], // list of tabs
        ),
      ),
      const TabBarView(
        children: [
          _DetailContentMenu(),
          _DetailContentMenu(), // class name
        ],
      ).box.make().h(150),
    ].column();
  }
}

class _DetailContentMenu extends StatelessWidget {
  const _DetailContentMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.'
        .text
        .align(TextAlign.justify)
        .make();
  }
}

class _BottomMenu extends StatelessWidget {
  const _BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      [
        const Icon(
          Icons.timelapse,
          color: Colors.blue,
          size: 35,
        ),
        Dimens.height15,
        '12pm-3pm'.text.coolGray400.make(),
      ].column(),
      [
        const Icon(
          Icons.directions,
          color: Colors.green,
          size: 35,
        ),
        Dimens.height15,
        '3.5 km'.text.coolGray400.make(),
      ].column(),
      [
        const Icon(
          Icons.map,
          color: Colors.red,
          size: 35,
        ),
        Dimens.height15,
        'Map View'.text.coolGray400.make(),
      ].column(),
      [
        const Icon(
          Icons.directions_bike,
          color: Colors.redAccent,
          size: 35,
        ),
        Dimens.height15,
        'Delivery'.text.coolGray400.make(),
      ].column(),
    ].row(
      alignment: MainAxisAlignment.spaceAround,
      axisSize: MainAxisSize.max,
    );
  }
}
