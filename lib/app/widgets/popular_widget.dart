import '../../app/configs/config.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const PopularFoodTitle(),
      const PopularFoodItems().expand(),
    ].column().box.make().h(250);
  }
}

class PopularFoodTiles extends StatelessWidget {
  const PopularFoodTiles({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.numberOfRating,
    required this.price,
    required this.slug,
  }) : super(key: key);
  final String name;
  final String imageUrl;
  final String rating;
  final String numberOfRating;
  final String price;
  final String slug;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.favorite,
              color: context.primaryColor,
              size: 16,
            )
                .box
                .alignment(Alignment.topRight)
                .padding(const EdgeInsets.only(right: 5, top: 5))
                .make()
                .w(28)
                .h(28),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Center(
                child: Image.asset(
              'assets/images/popular_foods/' + imageUrl + '.png',
              width: 130,
              height: 140,
            )),
          )
        ],
      ),
      <Widget>[
        name.text.coolGray500.medium.make().pOnly(left: 5, top: 5),
        Icon(Icons.near_me, color: context.primaryColor, size: 16)
            .box
            .padding(const EdgeInsets.only(right: 5))
            .make()
            .w(28)
            .h(28)
      ].row(
        alignment: MainAxisAlignment.spaceBetween,
        axisSize: MainAxisSize.max,
      ),
      <Widget>[
        <Widget>[
          rating.text.coolGray500
              .size(10)
              .minFontSize(6)
              .normal
              .make()
              .box
              .padding(const EdgeInsets.only(left: 5, top: 5))
              .alignment(Alignment.topLeft)
              .make(),
          Container(
            padding: const EdgeInsets.only(top: 3, left: 5),
            child: <Widget>[
              for (var i = 0; i < 4; i++)
                Icon(
                  Icons.star,
                  size: 10,
                  color: context.primaryColor,
                ),
              const Icon(
                Icons.star,
                size: 10,
                color: Color(0xFF9b9b9c),
              ),
            ].row(),
          ),
          '($numberOfRating)'
              .text
              .size(10)
              .minFontSize(6)
              .coolGray500
              .normal
              .make()
              .box
              .padding(const EdgeInsets.only(left: 5, top: 5))
              .alignment(Alignment.topLeft)
              .make(),
        ].row(
          alignment: MainAxisAlignment.spaceEvenly,
          axisSize: MainAxisSize.max,
        ),
        ('\$' + price)
            .text
            .coolGray600
            .size(12)
            .minFontSize(6)
            .semiBold
            .make()
            .box
            .alignment(Alignment.bottomLeft)
            .padding(const EdgeInsets.only(left: 5, right: 5, top: 5))
            .make(),
      ].row(
        alignment: MainAxisAlignment.spaceBetween,
        axisSize: MainAxisSize.max,
      ),
    ]
        .column()
        .box
        .padding(const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5))
        .make()
        .w(180)
        .card
        .elevation(0)
        .shape(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ))
        .make()
        .onInkTap(() {
      Routes.pushNamed(
        Routes.detail,
        arguments: 'assets/images/popular_foods/' + imageUrl + '.png',
      );
    });
  }
}

class PopularFoodTitle extends StatelessWidget {
  const PopularFoodTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      'Popluar Foods'.text.size(20).light.make(),
      'See all'.text.size(16).blue600.thin.make(),
    ]
        .row(
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
        )
        .box
        .padding(const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5))
        .make();
  }
}

class PopularFoodItems extends StatelessWidget {
  const PopularFoodItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: const <Widget>[
        PopularFoodTiles(
            name: 'Fried Egg',
            imageUrl: 'ic_popular_food_1',
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: 'fried_egg'),
        PopularFoodTiles(
            name: 'Mixed Vegetable',
            imageUrl: 'ic_popular_food_3',
            rating: '4.9',
            numberOfRating: '100',
            price: '17.03',
            slug: ''),
        PopularFoodTiles(
            name: 'Salad With Chicken',
            imageUrl: 'ic_popular_food_4',
            rating: '4.0',
            numberOfRating: '50',
            price: '11.00',
            slug: ''),
        PopularFoodTiles(
            name: 'Mixed Salad',
            imageUrl: 'ic_popular_food_5',
            rating: '4.00',
            numberOfRating: '100',
            price: '11.10',
            slug: ''),
        PopularFoodTiles(
            name: 'Red meat,Salad',
            imageUrl: 'ic_popular_food_2',
            rating: '4.6',
            numberOfRating: '150',
            price: '12.00',
            slug: ''),
        PopularFoodTiles(
            name: 'Mixed Salad',
            imageUrl: 'ic_popular_food_5',
            rating: '4.00',
            numberOfRating: '100',
            price: '11.10',
            slug: ''),
        PopularFoodTiles(
            name: 'Potato,Meat fry',
            imageUrl: 'ic_popular_food_6',
            rating: '4.2',
            numberOfRating: '70',
            price: '23.0',
            slug: ''),
        PopularFoodTiles(
            name: 'Fried Egg',
            imageUrl: 'ic_popular_food_1',
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: 'fried_egg'),
        PopularFoodTiles(
            name: 'Red meat,Salad',
            imageUrl: 'ic_popular_food_2',
            rating: '4.6',
            numberOfRating: '150',
            price: '12.00',
            slug: ''),
      ],
    );
  }
}
