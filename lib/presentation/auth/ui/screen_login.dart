import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/utilities/custom_form_validator.dart';
import 'package:food_app/core/widget/widget_app_button.dart';
import 'package:food_app/core/widget/widget_custom_form.dart';
import 'package:food_app/core/widget/widget_spacer.dart';
import 'package:food_app/generated/locale_keys.g.dart';
import 'package:food_app/presentation/auth/controller/store_auth.dart';
import 'package:food_app/presentation/auth/widget/widget_auth_title.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/presentation/auth/widget/widget_forgot_password.dart';
import 'package:food_app/presentation/auth/widget/widget_login_sign_up.dart';
import 'package:food_app/presentation/auth/widget/widget_logo.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController(text: 'ali@gmail.com');
  TextEditingController password = TextEditingController(text: '123456');

  final _storeAuth = getIt<StoreAuth>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 50,
            // ),

            const WidgetSpacer(),
            const WidgetLogo(),
            WidgetAuthScreenTitle(
              title: LocaleKeys.auth_screen_login_title.tr(),
            ),
            WidgetBodyText(
              title: LocaleKeys.auth_screen_login_sub_title.tr(),
            ),

            const WidgetSpacer(),
            WidgetCustomForm(
              hint: LocaleKeys.auth_screen_email.tr(),
              formKey: formKey,
              validator: CustomFormValidators.validateName,
              textEditingController: email,
            ),
            WidgetCustomForm(
              hint: LocaleKeys.auth_screen_password.tr(),
              formKey: formKey2,
              validator: CustomFormValidators.validatePassword,
              textEditingController: password,
            ),
            WidgetForgotPassword(
              onPress: () {
                Navigator.pushNamed(context, AppRoutes.forgotPassword);
              },
            ),
            Observer(
              builder: (context) {
                return  WidgetAppButton(
                  isLoading: _storeAuth.isLoading,
                    title: LocaleKeys.auth_screen_Login.tr(),
                    onPress: () {
                      if (formKey.currentState?.validate() == true &&
                          formKey2.currentState?.validate() == true) {
                        _storeAuth.login(email.text, password.text);
                      }
                    });
              }
            ),
            // WidgetAppButton(title: 'title2', onPress: (){},buttonStyle: AppTextStyle.buttonStyleBlack(),),
            WidgetLoginSignUp(
              title: LocaleKeys.auth_screen_sign_up.tr(),
              description: LocaleKeys.auth_screen_dont_have_account.tr(),
              onPress: () {
                Navigator.pushNamed(context, AppRoutes.signUp);
              },
            )
          ],
        ),
      ),
    );
  }
}
