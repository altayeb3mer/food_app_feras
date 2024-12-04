

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_image.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:food_app/presentation/dashboard/controller/controller_cart.dart';

class WidgetCartSingleItem extends StatelessWidget {
 // final String title;
 final EntityRestaurantItem item;
 final Function()? onRemoveItem;
 final Function()? onAdd;
   WidgetCartSingleItem({super.key, required this.item, this.onRemoveItem, this.onAdd});
 final _controllerCart = getIt<ControllerCart>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingDefault,vertical: Dimens.padding5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),

        ),
        height: 110,
        child: Row(
          children: [
            // Container(
            //   width: 130,
            //   height: 110,
            //   decoration: BoxDecoration(
            //     color: Colors.grey,
            //     borderRadius: BorderRadius.circular(10.0),
            //     image: DecorationImage(
            //       image: NetworkImage(
            //           'https://www.darya-varia.com/photos/Gambar%20Artikel%20Kesehatan/junk%20food.jpg'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Container(
              width: 130,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),

              ),
              child:  WidgetImage(imageUrl: item.imageLogo??''),
            ),


            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingDefault,vertical: Dimens.paddingDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetTitleTextSmall(title: item.itemName??''),
                            InkWell(onTap: ()=>onRemoveItem!() ?? (){}, child: Icon(Icons.cancel,color: Colors.red,))
                          ],
                        ),
                        WidgetBodyText(title: '${item.price} \$'),
                      ],
                    ),


                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border:Border.all(color: Colors.grey,width: 0.5) ,

                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(onTap: (){}, child:  Icon(Icons.remove,color: AppColors.colorAccent,size: 25,)),
                                SizedBox(width: Dimens.padding5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:  Dimens.padding5),
                                  child: WidgetBodyText(title: '1'),
                                ),
                                InkWell(onTap: (){}, child:  Icon(Icons.add,color: AppColors.colorAccent,size: 25,)),

                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.pin_drop,
                                  size: 15,
                                ),
                                WidgetBodyText(title: item.price??''),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
