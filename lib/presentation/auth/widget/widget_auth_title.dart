import 'package:flutter/material.dart';
import 'package:food_app/core/theme/text_style.dart';

class WidgetAuthScreenTitle extends StatelessWidget {
  final String title;
  const WidgetAuthScreenTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.textAuthScreenTitle(),
    );
  }
}
