import '../configs/config.dart';
import '../widgets/widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).orientation == Orientation.portrait
        ? context.height - context.padding.top - context.padding.bottom
        : context.width - context.padding.top - context.padding.bottom;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: <Widget>[
            Dimens.height30,
            Image.asset(
              ImageConstants.logo,
            ).box.make().h(context.height * .1),
            Dimens.height15,
            <Widget>[
              const Flexible(
                  flex: 1, child: InputCustom(hintText: 'First Name')),
              Dimens.width10,
              const Flexible(
                  flex: 1, child: InputCustom(hintText: 'Last Name')),
            ].row(),
            Dimens.height15,
            const InputCustom(
              hintText: 'Phone Number',
              prefixIcon: Icon(
                Icons.phone,
                color: Color(0xFF666666),
              ),
            ),
            Dimens.height15,
            const InputCustom(
              hintText: 'Invitation Code',
              prefixIcon: Icon(
                Icons.code,
                color: Color(0xFF666666),
              ),
            ),
            Dimens.height10,
            [
              Icon(
                Icons.info_outline,
                color: Colors.grey[600],
              ),
              " Leave empty if you don't have Invitation Code"
                  .text
                  .color(Colors.grey.shade600)
                  .make(),
            ].row(),
            Dimens.height15,
            AuthButton(
              title: context.tr('sign_up').toUpperCase(),
              onTap: () {},
            ),
            Dimens.height10,
            const SocialButton(),
            const Spacer(),
            <Widget>[
              "Don't have an account? ".text.color(Colors.grey.shade600).make(),
              context
                  .tr('sign_in')
                  .text
                  .color(const Color(0xFFf7418c))
                  .make()
                  .onTap(() {
                Navigator.of(context).pop();
              }),
            ].row().p(15)
          ]
              .column()
              .box
              .make()
              .w(context.width)
              .h(height)
              .pOnly(left: 20, right: 20),
        ),
      ),
    );
  }
}
