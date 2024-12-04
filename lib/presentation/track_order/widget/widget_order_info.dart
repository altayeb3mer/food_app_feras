part of '../ui/screen_track_order.dart';

class WidgetOrderInfo extends StatelessWidget {
  const WidgetOrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetBodyText(title: 'Wed 12 Sep'),
            WidgetBodyText(title: 'Order ID: ABC12345'),
          ],
        )),
        WidgetTitleTextSmall(title: 'AMT: 20.0'),
      ],
    );
  }
}
