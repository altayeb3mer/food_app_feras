import 'package:flutter/material.dart';
import 'package:food_app/core/theme/text_style.dart';

class WidgetTitleText extends StatelessWidget {
  final String title;
   Color? color;
   WidgetTitleText({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(title,style: AppTextStyle.textStyleTitle1(
      color: color,
    ),);
  }
}
