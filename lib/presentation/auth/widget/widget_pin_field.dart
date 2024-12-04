import 'package:flutter/material.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class WidgetPinField extends StatelessWidget {
  final int length;
  const WidgetPinField({super.key, required this.length});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: PinCodeTextField(
        length: length,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          borderWidth: 0.1,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(Dimens.borderRadiusDefault),
          fieldHeight: 45,
          fieldWidth: 45,
          activeFillColor: Colors.white,
          activeColor: Colors.grey,
          inactiveColor: Colors.grey
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: false,
        // errorAnimationController: errorController,
        // controller: textEditingController,
        onCompleted: (v) {
          print("Completed");
        },
        onChanged: (value) {
          // print(value);
          // setState(() {
          //   currentText = value;
          // });
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
        appContext: context,
      ),
    );
  }
}
