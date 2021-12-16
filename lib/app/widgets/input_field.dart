import '../configs/config.dart';

class InputCustom extends StatelessWidget {
  const InputCustom({
    Key? key,
    this.hintText,
    this.showCursor = true,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);
  final String? hintText;
  final bool showCursor, obscureText;
  final Widget? suffixIcon, prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      showCursor: showCursor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: const Color(0xFFF2F3F5),
        hintStyle: TextStyle(color: Colors.grey[600]),
        hintText: hintText,
      ),
    );
  }
}
