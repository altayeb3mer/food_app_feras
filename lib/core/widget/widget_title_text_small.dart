import 'package:flutter/material.dart';
import 'package:food_app/core/theme/text_style.dart';

class WidgetTitleTextSmall extends StatelessWidget {
  final String title;
   Color? color;
   WidgetTitleTextSmall({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(title,style: AppTextStyle.textStyleTitleSmall(
      color: color,
    ),);
  }
}
