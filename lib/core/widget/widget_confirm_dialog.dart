import 'package:flutter/material.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/theme/text_style.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_title_text.dart';

mixin WidgetConfirmDialog{
   Future<void> showAppDialog({required String title,required String body,required Function onConfirm,required Function onCancel,})async{
    final navigatorKey = getIt<GlobalKey<NavigatorState>>();
    final context = navigatorKey.currentContext!;
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: WidgetTitleText(title: title),
        content: WidgetBodyText(title: body,),
        actions: [
          _btnConfirm(context: context,title: 'Ok',onPressed:()=> onConfirm()),
          _btnCancel(context: context,title: 'Cancel',onPressed:()=> onCancel()),
        ],
      );
    });
  }
  Widget _btnConfirm({required BuildContext context,required String title,required Function onPressed,}){
    return TextButton(onPressed: (){
      Navigator.of(context).pop();
      onPressed();
    } , child: Text(title,style: AppTextStyle.textStyleTitleSmall(color: Colors.blue),));
 }
  Widget _btnCancel({required BuildContext context,required String title,required Function onPressed,}){
    return TextButton(onPressed:(){
      Navigator.of(context).pop();
      onPressed();
    } , child: Text(title,style: AppTextStyle.textStyleTitleSmall(color: Colors.grey),));
 }
}