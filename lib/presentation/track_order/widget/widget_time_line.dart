part of '../ui/screen_track_order.dart';

class WidgetTimeLine extends StatelessWidget {
  WidgetTimeLine({super.key});

  final List<ModelTimeLine> _list = [
    ModelTimeLine(
      title: 'Order Received',
      subTitle: 'Restaurant received the order',
      time: '3:00 PM',
      iconData: Icons.mobile_friendly,
      finished: true,
    ),
    ModelTimeLine(
      title: 'Ready to Deliver',
      subTitle: 'Order is prepared and ready to deliver',
      time: '3:10 PM',
      iconData: Icons.check_circle_outline,
      finished: true,
    ),
    ModelTimeLine(
      title: 'Delivering',
      subTitle: 'The order on the way to you',
      time: '3:15 PM',
      iconData: Icons.delivery_dining,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.paddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitleTextSmall(title: 'ETA: 15 MIN'),
          const SizedBox(height: Dimens.paddingVertical),
          ...timeLineList()
        ],
      ),
    );
  }

  timeLineList() {
    return List.generate(_list.length, (index) {
      return widgetTimeLine(_list[index]);
    });
  }

  widgetTimeLine(ModelTimeLine model) {
    return TimelineTile(
      axis: TimelineAxis.vertical,
      beforeLineStyle: model.finished ? _lineStyleGreen() : _lineStyleNormal(),
      afterLineStyle: model.finished ? _lineStyleGreen() : _lineStyleNormal(),
      indicatorStyle:
          model.finished ? _indicatorStyleGreen() : _indicatorStyleNormal(),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.paddingVertical),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Dimens.padding5),
                  child: Icon(model.iconData,
                  color: model.finished?AppColors.primaryColor:Colors.grey,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetTitleTextSmall(
                      title: model.title,
                      color: model.finished
                          ? Colors.black
                          : Colors.black.withOpacity(0.7),
                    ),
                    WidgetBodyText(title: model.subTitle),
                  ],
                )
              ],
            )),
            WidgetBodyText(title: model.time),
          ],
        ),
      ),
    );
  }

  LineStyle _lineStyleGreen() {
    return const LineStyle(color: Colors.green);
  }

  LineStyle _lineStyleNormal() {
    return const LineStyle();
  }

  IndicatorStyle _indicatorStyleGreen() {
    return const IndicatorStyle(width: 20, color: Colors.green);
  }

  IndicatorStyle _indicatorStyleNormal() {
    return const IndicatorStyle();
  }
}

class ModelTimeLine {
  final String title, subTitle, time;
  bool finished;
  final IconData iconData;

  ModelTimeLine(
      {required this.title,
      required this.subTitle,
      required this.time,
      required this.iconData,
      this.finished = false});
}
