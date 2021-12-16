import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../configs/config.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      [
        const DivederBottom(start: Colors.black12, end: Colors.black54),
        'Or'.text.make().pOnly(left: 15, right: 15),
        const DivederBottom(),
      ].row().pOnly(top: 10),
      <Widget>[
        const IconSocial(icon: FontAwesomeIcons.facebookF),
        40.widthBox,
        const IconSocial(icon: FontAwesomeIcons.google),
      ].row(),
    ].column();
  }
}

class IconSocial extends StatelessWidget {
  const IconSocial({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Colors.white)
        .box
        .color(const Color(0xFFf7418c))
        .p12
        .roundedFull
        .make()
        .pOnly(top: 10)
        .onInkTap(() {});
  }
}

class DivederBottom extends StatelessWidget {
  const DivederBottom(
      {Key? key, this.start = Colors.black54, this.end = Colors.black12})
      : super(key: key);
  final Color start, end;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      width: 100.0,
      height: 1.0,
    );
  }
}
