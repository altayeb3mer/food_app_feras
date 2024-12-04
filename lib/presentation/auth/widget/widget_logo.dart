import 'package:flutter/material.dart';
import 'package:food_app/core/widget/widget_spacer.dart';
import 'package:food_app/presentation/auth/widget/widget_logo_image.dart';

class WidgetLogo extends StatelessWidget {
  const WidgetLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
WidgetSpacer(),
        Center(
          child: LogoImage(),
        ),
      ],
    );
  }
}
