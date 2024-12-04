import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/navigation/route_generator.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_image.dart';
import 'package:food_app/core/widget/widget_title_text.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:food_app/presentation/restaurant/controller/controller_restaurant.dart';

class WidgetMenuList extends StatelessWidget {
  final _controllerRestaurant = getIt<ControllerRestaurant>();

   WidgetMenuList({super.key});

  @override
  Widget build(BuildContext context) {

    return Observer(
      builder: (context) {
        final list=_controllerRestaurant.selectedCategory?.items;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return widgetItem(context,list?[index]);
            },
            childCount: list?.length??0,
          ),
        );
      }
    );
  }
  widgetItem(BuildContext context,EntityRestaurantItem? item){

    return InkWell(
      onTap: (){
        _controllerRestaurant.setSelectedItem(item);
        RouteGenerator.navigateTo(routeName: AppRoutes.screenItemDetails);
      },
      child: SizedBox(
        height: 260,
        child: Padding(
          padding:   const EdgeInsets.symmetric(
        horizontal: Dimens.paddingHorizontal,
          vertical: Dimens.padding5),

          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.borderRadius10), // Set the radius here
            ),
            child: Column(
              children: [
                Expanded(child:

                WidgetImage(
                  imageUrl: item?.imageLogo ?? '',
                  radiusUse: false,
                )

                // Image.network(
                //   width: double.maxFinite,
                //
                //    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXj-IuHIdu8iGvBP7oQxeSNmx5SrsQ15vQuQ&s',
                //   fit: BoxFit.fitWidth,
                // )
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.padding5),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetTitleTextSmall(title: item?.itemName??''),
                      WidgetBodyText(title: '${item?.price}\$'),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
