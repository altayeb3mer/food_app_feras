import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';

class WidgetCustomForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String hint;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;

  const WidgetCustomForm({
    super.key,
    required this.formKey,
    required this.hint,
    this.validator,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.paddingDefault),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              validator: validator,
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: hint,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: Dimens.paddingDefault,
                    horizontal: Dimens.paddingHorizontal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Dimens.borderRadiusDefault), // Circular border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      Dimens.borderRadiusDefault), // Circular border on focus
                  borderSide: const BorderSide(
                      color: AppColors.colorGray,
                      width: Dimens.borderSizeDefault),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(Dimens.borderRadiusDefault),
                  // Circular border when enabled
                  borderSide: const BorderSide(
                      color: AppColors.colorGray,
                      width: Dimens.borderSizeDefault),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
