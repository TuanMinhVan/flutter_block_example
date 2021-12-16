import '../configs/config.dart';

class AppListTitle extends StatelessWidget {
  const AppListTitle({
    Key? key,
    this.title,
    this.subtitle,
    this.trailing,
    this.icon,
    this.onPressed,
    this.border = true,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool border;

  @override
  Widget build(BuildContext context) {
    late Border borderWidget;
    Widget subTitle = Container();
    Widget iconWidget = Container();
    if (icon != null) {
      iconWidget = Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: icon,
      );
    }
    if (subtitle != null) {
      subTitle = Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          subtitle ?? '',
          style: context.caption,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      );
    }
    if (border) {
      borderWidget = Border(
        bottom: BorderSide(
          width: 1,
          color: Theme.of(context).dividerColor,
        ),
      );
    }
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: <Widget>[
          iconWidget,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: borderWidget,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title ?? '',
                            style: context.bodyText1
                                .copyWith(fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          subTitle
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: trailing ?? Container(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
