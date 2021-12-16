import 'dart:math';

import '../../app/configs/config.dart';
import '../../app/widgets/widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: min(600, context.width),
          height: context.heightScale -
              context.padding.bottom -
              context.padding.top,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.height * .1,
                        child: Image.asset(ImageConstants.logo),
                      ),
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: context.padding.bottom + 20,
                  ),
                  child: context
                      .tr("don't_have_an_account")
                      .richText
                      .color(Colors.grey.shade600)
                      .withTextSpanChildren([
                    context
                        .tr('sign_up')
                        .textSpan
                        .tap(() {
                          Routes.pushNamed(Routes.register);
                        })
                        .color(const Color(0xFFf7418c))
                        .make(),
                  ]).make(),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
