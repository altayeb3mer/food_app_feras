import 'package:flutter/material.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/theme/text_style.dart';

class WidgetTransparentAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool enableBackPress;
  final String title;

  const WidgetTransparentAppbar(
      {super.key, this.enableBackPress = true, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: enableBackPress,
      title: Text(
        title,
        style: AppTextStyle.textStyleTitle2(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(Dimens.appbarSize);
}
