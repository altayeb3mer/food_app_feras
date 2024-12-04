
part of '../ui/screen_dashboard.dart';



class WidgetLocation extends StatelessWidget {
  const WidgetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: Dimens.paddingHorizontal,vertical: Dimens.paddingHorizontal),
      child: Column(
        children: [
          Row(
            children: [
             const Icon(Icons.pin_drop,size: 30,),
              Text('Riyadh regon btha..',style: AppTextStyle.textStyleBodyLarg(),),

            ],
          ),

          WidgetDivider(height: 1.0,
          color: AppColors.primaryColor,),
        ],
      ),
    );
  }
}
