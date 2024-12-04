import 'package:flutter/material.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/theme/text_style.dart';

class WidgetAppButton extends StatelessWidget {
  final String title;
  final Function onPress;
  double? width, horizontalPadding;
  ButtonStyle? buttonStyle;
  bool? isLoading;

  WidgetAppButton({
    super.key,
    required this.title,
    required this.onPress,
    this.buttonStyle,
    this.width,
    this.horizontalPadding,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? Dimens.paddingDefault,
        ),
        child: SizedBox(
          width: width ?? double.maxFinite,
          child: ElevatedButton(
            onPressed: () => isLoading == true ? () {} : onPress(),
            style: buttonStyle ?? AppTextStyle.buttonStyleWhite(),
            child: isLoading == true
                ? const Row(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 30,height: 30, child: CircularProgressIndicator(color: Colors.white,)),
                      SizedBox(width: Dimens.paddingVertical,),
                      Text('Loading'),
                    ],
                  )
                : Text(
                    title,
                    style: AppTextStyle.textButtonNormal(
                      color: buttonStyle == null ? Colors.white : Colors.black,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
