part of '../ui/screen_restaurant_menu.dart';

class WidgetInfoWithIcon extends StatelessWidget {
 final EntityRestaurant entityRestaurant;



  const WidgetInfoWithIcon({super.key, required this.entityRestaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widgetItem(
                iconData: Icons.navigation_outlined,
                title: LocaleKeys.item_details_screen_distance.tr(),
                subTitle: entityRestaurant.openTime??''),
            widgetItem(
                iconData: Icons.local_taxi_rounded,
                title:  LocaleKeys.item_details_screen_cost.tr(),
                subTitle: entityRestaurant.deliveryFee??''),
            widgetItem(
                iconData: Icons.access_time,
                title:  LocaleKeys.item_details_screen_close_at.tr(),
                subTitle: entityRestaurant.closeTime??''),
          ],
        ),
        const Divider()
      ],
    );
  }

  widgetItem(
      {required IconData iconData,
      required String title,
      required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData),
        WidgetBodyText(title: title),
        WidgetTitleTextSmall(title: subTitle),
      ],
    );
  }
}
