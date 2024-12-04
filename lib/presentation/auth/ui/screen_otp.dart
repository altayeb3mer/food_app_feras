import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/widget/widget_app_button.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_spacer.dart';
import 'package:food_app/generated/locale_keys.g.dart';
import 'package:food_app/presentation/auth/widget/widget_auth_title.dart';
import 'package:food_app/presentation/auth/widget/widget_logo.dart';
import 'package:food_app/presentation/auth/widget/widget_pin_field.dart';

class ScreenOtp extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ScreenOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WidgetSpacer(),
            const WidgetLogo(),
            WidgetAuthScreenTitle(
              title: LocaleKeys.auth_screen_otp_title.tr(),
            ),
            WidgetBodyText(
              title:
                  LocaleKeys.auth_screen_otp_sub_title.tr(args: ["1234567890"]),
            ),
            const WidgetSpacer(),
           const WidgetPinField(length: 4),
            const WidgetSpacer(),
            WidgetAppButton(
                width: 200,
                title: LocaleKeys.common_send.tr(),
                onPress: () {
                  Navigator.pushNamed(
                      context, AppRoutes.screenChangePassword);
                }),
          ],
        ),
      ),
    );
  }
}
