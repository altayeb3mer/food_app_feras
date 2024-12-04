import 'package:flutter/material.dart';
import 'package:food_app/core/theme/dimens.dart';

class WidgetSpacer extends StatelessWidget {
  const WidgetSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: Dimens.spacer50,
    );
  }
}
