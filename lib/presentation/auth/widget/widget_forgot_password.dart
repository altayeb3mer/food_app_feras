import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/theme/text_style.dart';
import 'package:food_app/core/widget/widget_text_button.dart';
import 'package:food_app/generated/locale_keys.g.dart';

class WidgetForgotPassword extends StatelessWidget {
 final Function onPress;
  const WidgetForgotPassword({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      // Aligns widgets at the end of the row
      children: <Widget>[
        WidgetTextButton(
          title: LocaleKeys.auth_screen_do_you_forgot_password.tr(),
          onPress: ()=>onPress(),
          textStyle: AppTextStyle.textButtonNormal(),
        ),
      ],
    );
  }
}
