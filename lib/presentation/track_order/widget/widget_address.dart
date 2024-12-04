part of '../ui/screen_track_order.dart';
class WidgetAddress extends StatelessWidget {
  const WidgetAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.paddingDefault),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.maps_home_work_sharp,color: AppColors.primaryColor,size: 30,),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetTitleTextSmall(title: 'Delivery Address'),
                  WidgetBodyText(title: 'Riyadh regon batha..'),
                  WidgetBodyText(title: 'City: Riyadh'),
                  WidgetBodyText(title: 'Street: Anas ben malik st'),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
