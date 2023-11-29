import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peruri_app/presentation/widgets/atoms/platform_widget.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar> implements PreferredSizeWidget {
  final Widget title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? color;
  const PlatformAppBar({
    super.key,
    required this.title,
    this.leading,
    this.bottom,
    this.elevation,
    this.color,
  });

  @override
  Size get preferredSize => Size.fromHeight(UIHelper.setSp(70));

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) => CupertinoNavigationBar(
        middle: title,
        leading: leading,
      );

  @override
  AppBar createAndroidWidget(BuildContext context) => AppBar(
        title: title,
        leading: leading,
        bottom: bottom,
        elevation: elevation,
        backgroundColor: color,
      );
}
