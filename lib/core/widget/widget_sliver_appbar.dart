import 'package:flutter/material.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/widget/widget_image.dart';

class WidgetSliverAppbar extends StatelessWidget {
  String? image, title;
  List<Widget>? actions;
  final bool enableBackPress;
  Function? onBack;
  BuildContext screenContext;

  WidgetSliverAppbar(
      {super.key,
      this.image,
      this.title,
      this.actions,
      required this.enableBackPress,
      this.onBack,
      required this.screenContext});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      automaticallyImplyLeading:enableBackPress?true: false,
      pinned: true,
      // leading: enableBackPress
      //     ? IconButton(
      //         onPressed: () {
      //           onBack ?? Navigator.of(screenContext).pop();
      //         },
      //         icon: const Icon(Icons.arrow_back_ios))
      //     : const SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        title: title != null ? Text(title ?? '') : const SizedBox(),
        background: image != null
            ?
            WidgetImage(imageUrl: image ?? '',)
        // Image.network(
        //         image ?? '',
        //         fit: BoxFit.cover,
        //       )
            : const SizedBox(),
      ),
      actions: actions,
    );
  }
}
