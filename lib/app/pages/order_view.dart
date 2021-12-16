import '../configs/config.dart';
import '../configs/theme.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: 'Item Carts'.text.make(),
        centerTitle: true,
        actions: const <Widget>[
          _CartIconWithBadge(),
        ],
      ),
      body: <Widget>[
        'Your Food Cart'.text.size(20).semiBold.make(),
        Dimens.height10,
        const _CartItem(
          productName: 'Grilled Salmon',
          productPrice: '\$96.00',
          productImage: 'ic_popular_food_1',
          productCartQuantity: '2',
        ),
        Dimens.height10,
        const _CartItem(
          productName: 'Meat vegetable',
          productPrice: '\$65.08',
          productImage: 'ic_popular_food_4',
          productCartQuantity: '5',
        ),
        Dimens.height10,
        const _PromoCodeWidget(),
        Dimens.height10,
        const _TotalCalculationWidget(),
        Dimens.height10,
        ' Payment Method'.text.size(20).semiBold.make(),
        Dimens.height10,
        const _PaymentMethodWidget(),
      ]
          .column(crossAlignment: CrossAxisAlignment.start)
          .box
          .p12
          .make()
          .scrollVertical(),
    );
  }
}

class _CartIconWithBadge extends StatelessWidget {
  const _CartIconWithBadge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const counter = 3;
    return Stack(
      children: <Widget>[
        IconButton(icon: const Icon(Icons.business_center), onPressed: () {}),
        counter != 0
            ? Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: context.primaryColor,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class _CartItem extends StatelessWidget {
  const _CartItem({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productCartQuantity,
  }) : super(key: key);
  final String productName;
  final String productPrice;
  final String productImage;
  final String productCartQuantity;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Image.asset(
        'assets/images/popular_foods/$productImage.png',
        width: 110,
        height: 100,
      ),
      <Widget>[
        <Widget>[
          [
            productName.text.size(18).make(),
            Dimens.height5,
            productPrice.text.size(18).make(),
          ].column(
            crossAlignment: CrossAxisAlignment.start,
          ),
          const Spacer(),
          Image.asset(
            'assets/images/menus/ic_delete.png',
            width: 25,
            height: 25,
          ),
          10.widthBox,
        ].row(axisSize: MainAxisSize.max),
        const [Spacer(), _AddToCartMenu(2)].row(),
      ].column().expand(),
    ]
        .row(axisSize: MainAxisSize.max)
        .card
        .elevation(1)
        .color(
          AppTheme.darkThemeOption == DarkOption.alwaysOff
              ? context.cardColor
              : Colors.white,
        )
        .make();
  }
}

class _AddToCartMenu extends StatelessWidget {
  const _AddToCartMenu(this.productCounter);
  final int productCounter;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.remove),
        color: context.onBackground,
        iconSize: 18,
      ),
      'Add To $productCounter'
          .text
          .size(12)
          .white
          .make()
          .centered()
          .box
          .withRounded(value: 5)
          .color(context.primaryColor)
          .outerShadowLg
          .make()
          .w(100.0)
          .h(35.0)
          .onInkTap(() {}),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
        color: context.primaryColor,
        iconSize: 18,
      ),
    ].row(
      axisSize: MainAxisSize.max,
      alignment: MainAxisAlignment.center,
    );
  }
}

class _PromoCodeWidget extends StatelessWidget {
  const _PromoCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFe6e1e1), width: 1.0),
          borderRadius: BorderRadius.circular(7),
        ),
        fillColor: context.background,
        hintText: 'Add Your Promo Code',
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(
            Icons.local_offer,
            color: context.primaryColor,
          ),
          onPressed: () {},
        ),
      ),
    ).pOnly(left: 3, right: 3);
  }
}

class _TotalCalculationWidget extends StatelessWidget {
  const _TotalCalculationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        'Grilled Salmon'.text.size(18).make(),
        '\$192'.text.size(18).make(),
      ].row(
        alignment: MainAxisAlignment.spaceBetween,
        axisSize: MainAxisSize.max,
      ),
      Dimens.height15,
      <Widget>[
        'Meat vegetable'.text.size(18).make(),
        '\$102'.text.size(18).make(),
      ].row(
        alignment: MainAxisAlignment.spaceBetween,
        axisSize: MainAxisSize.max,
      ),
      Dimens.height15,
      <Widget>[
        'Total'.text.size(18).semiBold.make(),
        '\$292'.text.size(18).semiBold.make(),
      ].row(
        alignment: MainAxisAlignment.spaceBetween,
        axisSize: MainAxisSize.max,
      ),
    ]
        .column()
        .box
        .withDecoration(
          BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFfae3e2).withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              )
            ],
          ),
        )
        .padding(const EdgeInsets.fromLTRB(25, 10, 30, 10))
        .make()
        .h(150);
  }
}

class _PaymentMethodWidget extends StatelessWidget {
  const _PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Image.asset(
        'assets/images/menus/ic_credit_card.png',
        width: 50,
        height: 50,
      ),
      'Credit/Debit Card'.text.size(16).make(),
    ]
        .row(axisSize: MainAxisSize.max)
        .box
        .padding(const EdgeInsets.fromLTRB(10, 10, 30, 10))
        .make()
        .card
        .elevation(0)
        .color(
          AppTheme.darkThemeOption == DarkOption.alwaysOff
              ? context.cardColor
              : Colors.white,
        )
        .make()
        .box
        .alignment(Alignment.center)
        .withDecoration(BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color(0xFFfae3e2).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ]))
        .height(60)
        .make();
  }
}
