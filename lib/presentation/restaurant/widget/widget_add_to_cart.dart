import 'package:flutter/material.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/theme/text_style.dart';
import 'package:food_app/core/widget/widget_body_text.dart';

class WidgetAddToCartBtn extends StatelessWidget {
  final String title, price;
  final Function onPress;
  double? width;
  ButtonStyle? buttonStyle;

  WidgetAddToCartBtn({
    super.key,
    required this.title,
    required this.price,
    required this.onPress,
    this.buttonStyle,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(),
      style: buttonStyle ?? AppTextStyle.buttonStyleWhite(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.textButtonNormal(
              color: buttonStyle == null ? Colors.white : Colors.black,
            ),
          ),
          WidgetBodyText(title: '13 \$'),
        ],
      ),
    );
  }
}
