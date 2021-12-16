import '../../app/configs/config.dart';

class BestWidget extends StatelessWidget {
  const BestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      const BestFoodTitle(),
      const BestFoodList(),
    ].column().box.make();
  }
}

class BestFoodTitle extends StatelessWidget {
  const BestFoodTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return <Widget>['Best Foods'.text.size(20).light.make()]
        .row(
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
        )
        .box
        .padding(const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5))
        .make();
  }
}

class BestFoodTiles extends StatelessWidget {
  const BestFoodTiles({
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
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: Dimens.cardBorder,
      elevation: 1,
      margin: const EdgeInsets.all(5),
      child: Image.asset(
        'assets/images/bestfood/' + imageUrl + '.jpeg',
      ),
    )
        .box
        .padding(const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5))
        .make()
        .onInkTap(() {});
  }
}

class BestFoodList extends StatelessWidget {
  const BestFoodList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: const <Widget>[
        BestFoodTiles(
            name: 'Fried Egg',
            imageUrl: 'ic_best_food_8',
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: 'fried_egg'),
        BestFoodTiles(
            name: 'Mixed vegetable',
            imageUrl: 'ic_best_food_9',
            rating: '4.9',
            numberOfRating: '100',
            price: '17.03',
            slug: ''),
        BestFoodTiles(
            name: 'Salad with chicken meat',
            imageUrl: 'ic_best_food_10',
            rating: '4.0',
            numberOfRating: '50',
            price: '11.00',
            slug: ''),
        BestFoodTiles(
            name: 'New mixed salad',
            imageUrl: 'ic_best_food_5',
            rating: '4.00',
            numberOfRating: '100',
            price: '11.10',
            slug: ''),
        BestFoodTiles(
            name: 'Red meat with salad',
            imageUrl: 'ic_best_food_1',
            rating: '4.6',
            numberOfRating: '150',
            price: '12.00',
            slug: ''),
        BestFoodTiles(
            name: 'New mixed salad',
            imageUrl: 'ic_best_food_2',
            rating: '4.00',
            numberOfRating: '100',
            price: '11.10',
            slug: ''),
        BestFoodTiles(
            name: 'Potato with meat fry',
            imageUrl: 'ic_best_food_3',
            rating: '4.2',
            numberOfRating: '70',
            price: '23.0',
            slug: ''),
        BestFoodTiles(
            name: 'Fried Egg',
            imageUrl: 'ic_best_food_4',
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: 'fried_egg'),
        BestFoodTiles(
            name: 'Red meat with salad',
            imageUrl: 'ic_best_food_5',
            rating: '4.6',
            numberOfRating: '150',
            price: '12.00',
            slug: ''),
        BestFoodTiles(
            name: 'Red meat with salad',
            imageUrl: 'ic_best_food_6',
            rating: '4.6',
            numberOfRating: '150',
            price: '12.00',
            slug: ''),
        BestFoodTiles(
            name: 'Red meat with salad',
            imageUrl: 'ic_best_food_7',
            rating: '4.6',
            numberOfRating: '150',
            price: '12.00',
            slug: ''),
      ],
    );
  }
}
