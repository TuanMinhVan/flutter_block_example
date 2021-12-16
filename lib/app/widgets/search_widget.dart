import '../../app/configs/config.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            width: 0,
            color: context.primaryColor,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        prefixIcon: Icon(Icons.search, color: context.primaryColor),
        fillColor: Colors.grey[100],
        suffixIcon: Icon(Icons.sort, color: context.primaryColor),
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
        hintText: 'What would your like to buy?',
      ),
    ).pOnly(left: 10, top: 5, right: 10, bottom: 5);
  }
}
