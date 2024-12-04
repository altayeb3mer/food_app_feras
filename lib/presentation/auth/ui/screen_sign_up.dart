import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/core/utilities/custom_form_validator.dart';
import 'package:food_app/core/widget/widget_app_button.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_custom_form.dart';
import 'package:food_app/core/widget/widget_spacer.dart';
import 'package:food_app/generated/locale_keys.g.dart';
import 'package:food_app/presentation/auth/controller/store_auth.dart';
import 'package:food_app/presentation/auth/widget/widget_auth_title.dart';
import 'package:food_app/presentation/auth/widget/widget_login_sign_up.dart';
import 'package:food_app/presentation/auth/widget/widget_logo.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final GlobalKey<FormState> formNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formLastNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formPasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formConfirmPasswordKey = GlobalKey<FormState>();

  //TextEditingController
  TextEditingController firstName = TextEditingController(text: 'Altayeb');
  TextEditingController lastName = TextEditingController(text: 'Almubarak');
  TextEditingController email = TextEditingController(text: 'ali@gmail.com');
  TextEditingController password = TextEditingController(text: '123456');
  TextEditingController confirmPassword = TextEditingController(text: '123456');

  //store

  final _storeAuth = getIt<StoreAuth>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WidgetSpacer(),
            const WidgetLogo(),
            WidgetAuthScreenTitle(
              title: LocaleKeys.auth_screen_sign_up_title.tr(),
            ),
            WidgetBodyText(
              title: LocaleKeys.auth_screen_sign_up_sub_title.tr(),
            ),
            const WidgetSpacer(),
            WidgetCustomForm(
              hint: LocaleKeys.auth_screen_first_name.tr(),
              formKey: formNameKey,
              validator: CustomFormValidators.validateName,
              textEditingController: firstName,
            ),
            WidgetCustomForm(
              hint: LocaleKeys.auth_screen_last_name.tr(),
              formKey: formLastNameKey,
              validator: CustomFormValidators.validateName,
              textEditingController: lastName,
            ),
            WidgetCustomForm(
              hint: LocaleKeys.auth_screen_phone.tr(),
              formKey: formEmailKey,
              validator: CustomFormValidators.validateEmail,
              textEditingController: email,
            ),
            WidgetCustomForm(
              hint: LocaleKeys.auth_screen_password.tr(),
              formKey: formPasswordKey,
              validator: CustomFormValidators.validatePassword,
              textEditingController: password,
            ),
            WidgetCustomForm(
              hint: LocaleKeys.auth_screen_confirm_password.tr(),
              formKey: formConfirmPasswordKey,
              validator: CustomFormValidators.validatePassword,
              textEditingController: confirmPassword,
            ),
            Observer(
              builder: (context) {
                return WidgetAppButton(
                  isLoading: _storeAuth.isLoading,
                  title: LocaleKeys.auth_screen_sign_up.tr(),
                  onPress: () {
                    if (formNameKey.currentState?.validate() != true ||
                        formLastNameKey.currentState?.validate() != true ||
                        formEmailKey.currentState?.validate() != true ||
                        formPasswordKey.currentState?.validate() != true ||
                        formConfirmPasswordKey.currentState?.validate() != true) {
                      AppMassager.showError('Validate Error');
                      return;
                    }
                    if (password.text != confirmPassword.text) {
                      AppMassager.showError('Pass not match');
                      return;
                    }
                    _storeAuth.register(
                      email.text,
                      password.text,
                      '${firstName.text} ${lastName.text}',
                    );
                  },
                );
              }
            ),
            WidgetLoginSignUp(
              title: LocaleKeys.auth_screen_Login.tr(),
              description: LocaleKeys.auth_screen_already_have_account.tr(),
              onPress: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
            )

            ////////end column
          ],
        ),
      ),
    );
  }
}
