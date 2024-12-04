

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/utilities/custom_form_validator.dart';
import 'package:food_app/core/widget/widget_app_button.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_custom_form.dart';
import 'package:food_app/core/widget/widget_spacer.dart';
import 'package:food_app/generated/locale_keys.g.dart';
import 'package:food_app/presentation/auth/widget/widget_auth_title.dart';
import 'package:food_app/presentation/auth/widget/widget_logo.dart';

class ScreenForgotPassword extends StatelessWidget {
   ScreenForgotPassword({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const WidgetSpacer(),
          const WidgetLogo(),
          WidgetAuthScreenTitle(
            title: LocaleKeys.auth_screen_forgot_password.tr(),
          ),
          WidgetBodyText(
            title: LocaleKeys.auth_screen_forgot_password_desc.tr(),
          ),
          const WidgetSpacer(),
          WidgetCustomForm(
            hint: LocaleKeys.auth_screen_phone.tr(),
            formKey: formKey,
            validator: CustomFormValidators.validateName,
          ),
          WidgetAppButton(
              title: LocaleKeys.common_send.tr(), onPress: () {
            Navigator.pushNamed(context, AppRoutes.screenOtp);

          }),
        ],),
      ),
    );
  }
}
