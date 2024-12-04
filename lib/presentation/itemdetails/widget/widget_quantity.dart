import 'package:flutter/material.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';

class WidgetQuantity extends StatelessWidget {
  const WidgetQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(child: WidgetBodyText(title: 'Price according to quantity')),
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.remove,
                        color: AppColors.colorAccent,
                        size: 25,
                      )),
                  SizedBox(width: Dimens.padding5),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Dimens.padding5),
                    child: WidgetBodyText(title: '1'),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        color: AppColors.colorAccent,
                        size: 25,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
