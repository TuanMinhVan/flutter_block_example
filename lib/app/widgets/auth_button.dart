import '../configs/config.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return title.text.white
        .size(18)
        .makeCentered()
        .pSymmetric(v: 10.0, h: 42.0)
        .box
        .withRounded(value: 5.0)
        .linearGradient(
          const [Color(0xFFf7418c), Color(0xFFfbab66)],
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
          begin: const FractionalOffset(0.2, 0.2),
          end: const FractionalOffset(1.0, 1.0),
        )
        .make()
        .w(double.infinity)
        .onInkTap(onTap);
  }
}
