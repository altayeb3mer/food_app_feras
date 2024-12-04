import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';

class WidgetBreadChoice extends StatelessWidget {
  const WidgetBreadChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widgetTitle(),
          // WidgetBodyText(title: 'Choose'),
          const SizedBox(height: 20,),
          _rowItem('Plain bread', '1'),
          _rowItem('Bread cake', '1.5'),
          _rowItem('Plain bread', '1', isLast: true),
        ],
      ),
    );
  }

  widgetTitle() {
    return Row(
      children: [
        Expanded(
          child: WidgetTitleTextSmall(title: 'Your Choice of Bread'),
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.grey, width: 0.5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: WidgetBodyText(title: 'Requird'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _rowItem(String title, String price, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: WidgetBodyText(title: title),
              ),
              WidgetBodyText(title: '(+$price \$)'),
              Radio(value: '1', groupValue: '2', onChanged: (value) {})
            ],
          ),
        ),
        Visibility(visible: !isLast, child: Divider())
      ],
    );
  }
}
