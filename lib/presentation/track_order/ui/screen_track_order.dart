import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';
import 'package:food_app/core/widget/widget_transparent_appbar.dart';
import 'package:timeline_tile/timeline_tile.dart';

part '../widget/widget_order_info.dart';
part '../widget/widget_time_line.dart';
part '../widget/widget_address.dart';

class ScreenTrackOrder extends StatefulWidget {
  const ScreenTrackOrder({super.key});

  @override
  State<ScreenTrackOrder> createState() => _ScreenTrackOrderState();
}

class _ScreenTrackOrderState extends State<ScreenTrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetTransparentAppbar(
        title: 'Track Order',
        enableBackPress: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingDefault,
              vertical: Dimens.paddingDefault),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              WidgetOrderInfo(),
              WidgetTimeLine(),
              WidgetAddress()
            ],
          ),
        ),
      ),
    );
  }
}
