import 'dart:math';

import '../../app/configs/config.dart';
import '../../app/widgets/widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).orientation == Orientation.portrait
        ? context.height
        : context.width;
    return Scaffold(
        body: <Widget>[
      Flexible(
        child: <Widget>[
          Image.asset(
            ImageConstants.logo,
          ).box.make().h(context.height * .1),
          Dimens.height15,
          InputCustom(
            hintText: context.tr('phone'),
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.grey[600],
            ),
          ),
          Dimens.height15,
          InputCustom(
            hintText: context.tr('password'),
            obscureText: true,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Colors.grey[600],
            ),
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: Colors.grey[600],
            ),
          ),
          Dimens.height15,
          context
              .tr('forgot_password')
              .text
              .gray600
              .align(TextAlign.end)
              .make()
              .box
              .make()
              .w(double.infinity),
          Dimens.height15,
          AuthButton(
              title: context.tr('sign_in'),
              onTap: () {
                Routes.pushNamed(Routes.home);
              }),
          Dimens.height2,
          const SocialButton()
        ].column(
          alignment: MainAxisAlignment.center,
          axisSize: MainAxisSize.max,
        ),
      ),
      <Widget>[
        context
            .tr("don't_have_an_account")
            .text
            .color(Colors.grey.shade600)
            .make(),
        context
            .tr('sign_up')
            .text
            .color(const Color(0xFFf7418c))
            .make()
            .onTap(() {
          Routes.pushNamed(Routes.register);
        }),
      ].row().pOnly(bottom: context.padding.bottom + 20)
    ]
            .column()
            .box
            .make()
            .w(min(600, context.width))
            .h(height)
            .pOnly(left: 20, right: 20)
            .centered()
            .scrollVertical());
  }
}
