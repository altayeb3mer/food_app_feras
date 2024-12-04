import 'package:flutter/material.dart';

class WidgetBodyText extends StatelessWidget {
  final String title;
  const WidgetBodyText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
