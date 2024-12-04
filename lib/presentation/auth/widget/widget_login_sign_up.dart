import 'package:flutter/material.dart';
import 'package:food_app/core/theme/text_style.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_text_button.dart';

class WidgetLoginSignUp extends StatelessWidget {
  final String title, description;
  final Function onPress;

  const WidgetLoginSignUp({
    super.key,
    required this.title,
    required this.description,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetBodyText(
          title: description,
        ),
        WidgetTextButton(
          title: title,
          onPress: onPress,
          textStyle: AppTextStyle.textButtonNormal(color: Colors.black),
        ),
      ],
    );
  }
}
