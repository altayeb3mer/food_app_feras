import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_app/generated/locale_keys.g.dart';
import 'package:food_app/main_core.dart';

class CustomFormValidators {
  // Static validator for name input
  static FormFieldValidator<String>? validateName = (String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.form_validator_required_field.tr(); // Return error message if validation fails
    }
    return null; // Return null if validation passes
  };

  // Static validator for email input
  static FormFieldValidator<String>? validateEmail = (String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.form_validator_required_field.tr();
    } else if (!value.contains('@')) {
      return LocaleKeys.form_validator_email.tr();
    }
    return null;
  };

  // Static validator for password input
  static FormFieldValidator<String>? validatePassword = (String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.form_validator_required_field.tr();
    } else if (value.length < 6) {
      return LocaleKeys.form_validator_password.tr();
    }
    return null;
  };
}
