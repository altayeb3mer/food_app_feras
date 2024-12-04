import 'package:flutter/material.dart';
import 'package:food_app/core/theme/text_style.dart';

class WidgetTextButton extends StatelessWidget {
  final String title;
  final Function onPress;
  TextStyle? textStyle;
  WidgetTextButton(
      {super.key, required this.title, required this.onPress, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPress(),
        child: Text(
          title,
          style: textStyle ?? AppTextStyle.textButtonBold(),
        ));
  }
}
