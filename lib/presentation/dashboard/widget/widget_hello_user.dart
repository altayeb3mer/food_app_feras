
part of '../ui/screen_dashboard.dart';



class WidgetHelloUser extends StatelessWidget {
  const WidgetHelloUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: Dimens.paddingHorizontal,),
      child: Row(
        children: [
          Text('Hello',style: AppTextStyle.textStyleBodyNormal(),),
         const SizedBox(width: 5),
          Text('Altayeb',style: AppTextStyle.textStyleBodyNormal(fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }
}
