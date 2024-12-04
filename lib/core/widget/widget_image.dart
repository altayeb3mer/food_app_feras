import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WidgetImage extends StatelessWidget {
  String imageUrl;
  double? width, height;
  bool? radiusUse;

  WidgetImage(
      {required this.imageUrl,
       this.width,
       this.height,
       this.radiusUse,
      super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: width??double.maxFinite,
      height: height??double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius:radiusUse!=false? BorderRadius.circular(10.0):null,
        // image: DecorationImage(
        //   image: NetworkImage(
        //       entityRestaurant.imageLogoUrl??''),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        placeholder: (context, url) =>
       const Center(child:  SizedBox(width:30,height: 30,child: CircularProgressIndicator())),
        errorWidget: (context, url, error) =>const Icon(Icons.error),
      ),
    );
  }
}
