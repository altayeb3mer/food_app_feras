import 'package:flutter/material.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';

class WidgetAdditions extends StatelessWidget {
  const WidgetAdditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitleTextSmall(title: 'Additions'),
          // WidgetBodyText(title: 'Choose'),
          const SizedBox(
            height: 10,
          ),
          widgetCheckedItems(),
          widgetCheckedItems(isLast: true,price: '2'),
        ],
      ),
    );
  }
  widgetCheckedItems({String? price,bool isLast=false}){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (check){}),
                    WidgetBodyText(title: 'title'),
                  ],
                ),
              ),
             price!=null? WidgetBodyText(title: '($price)'):SizedBox(),
            ],
          ),
        ),
        Visibility(visible: !isLast, child: Divider())
      ],
    );
  }
}
