import 'package:flutter/material.dart';
import 'package:food_app/core/theme/dimens.dart';

class WidgetDivider extends StatelessWidget {
  final double height;
  final double borderRadius;
  final Color color;

  const WidgetDivider(
      {super.key, 
      this.height = 0.5,
      this.borderRadius = Dimens.borderRadius20,
      this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // Thickness of the divider
      width: double.infinity,
      // Full width
      margin: const EdgeInsets.all(Dimens.paddingDefault),
      // Add some vertical space
      decoration: BoxDecoration(
        color: color, // Background color of the divider
        borderRadius: BorderRadius.circular(borderRadius), // Border radius
      ),
    );
  }
}
