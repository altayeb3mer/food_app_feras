import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';

class AppTextStyle {
  //----------------------------------main
  //body text style
  static TextStyle textStyleBodyNormal({FontWeight fontWeight= FontWeight.normal}) {
    return  TextStyle(fontSize: Dimens.fontSizeBodyNormal,fontWeight: fontWeight);
  }

  static TextStyle textStyleBodyLarg() {
    return const TextStyle(fontSize: Dimens.fontSizeBodyLarg);
  }

  static TextStyle textStyleBodySmall() {
    return const TextStyle(fontSize: Dimens.fontSizeBodySmall);
  }

//button text style
  static TextStyle textStyleButtonNormal() {
    return const TextStyle(fontSize: Dimens.fontSizeButtonNormal);
  }

  static TextStyle textStyleButtonLarg() {
    return const TextStyle(fontSize: Dimens.fontSizeButtonLarg);
  }

  static TextStyle textStyleButtonSmall() {
    return const TextStyle(fontSize: Dimens.fontSizeButtonSmall);
  }

//title text style
  static TextStyle textStyleTitleNormal() {
    return const TextStyle(fontSize: Dimens.fontSizeTitleNormal);
  }

  static TextStyle textStyleTitleLarg() {
    return const TextStyle(fontSize: Dimens.fontSizeTitleLarg);
  }



  //----------------------------------custum
  //auth screen title
  static TextStyle textAuthScreenTitle() {
    return const TextStyle(
      fontSize: Dimens.fontSizeTitleLarg,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle textButtonBold() {
    return const TextStyle(
      fontSize: Dimens.fontSizeTitleNormal,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle textButtonNormal({Color? color}) {
    return  TextStyle(
      fontSize: Dimens.fontSizeTitleNormal,
      color: color??Colors.grey,
    );
  }
  static TextStyle textStyleTitleSmall({Color? color}) {
    return  TextStyle(
      fontSize: Dimens.fontSizeTitleSmall14,
      color: color??Colors.black,
      fontWeight: FontWeight.bold
    );
  }  static TextStyle textStyleTitle1({Color? color}) {
    return  TextStyle(
      fontSize: Dimens.fontSizeTitleNormal,
      color: color??Colors.black,
      fontWeight: FontWeight.bold
    );
  }
  static TextStyle textStyleTitle2({Color? color}) {
    return  TextStyle(
      fontSize: Dimens.fontSizeTitleLarg,
      color: color??Colors.black,
      fontWeight: FontWeight.bold
    );
  }


  static ButtonStyle buttonStyleWhite(){
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryColor), // Background color
    foregroundColor: WidgetStateProperty.all<Color>(Colors.white), // Text color
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.borderRadiusDefault), // Rounded corners
      ),
    ),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: Dimens.paddingDefault, vertical: Dimens.paddingDefault), // Button padding
    ),
  );
  }
  static ButtonStyle buttonStyleWhite2(){
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent), // Background color
    foregroundColor: WidgetStateProperty.all<Color>(Colors.black), // Text color
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.borderRadiusDefault), // Rounded corners
      ),
    ),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: Dimens.paddingDefault, vertical: Dimens.paddingDefault), // Button padding
    ),
  );
  }
  static ButtonStyle buttonStyleBlack(){
  return ElevatedButton.styleFrom(
    textStyle: textButtonNormal(color: Colors.black), // Text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.borderRadiusDefault), // Rounded corners
    ),
    padding:const EdgeInsets.symmetric(horizontal: Dimens.paddingDefault, vertical: Dimens.paddingDefault), // Button padding
  );
  }
}
