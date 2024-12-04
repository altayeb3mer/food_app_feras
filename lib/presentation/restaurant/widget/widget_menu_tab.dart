import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/presentation/restaurant/controller/controller_restaurant.dart';

class WidgetMenuTab extends StatefulWidget {
  const WidgetMenuTab({super.key});

  @override
  State<WidgetMenuTab> createState() => _WidgetMenuTabState();
}

class _WidgetMenuTabState extends State<WidgetMenuTab> {
  final _controllerRestaurant = getIt<ControllerRestaurant>();



  @override
  Widget build(BuildContext context) {
    return widgetTab();
  }

  widgetTab() {
    final list=_controllerRestaurant.selectedRestaurant?.entityRestaurantCategory;
    _controllerRestaurant.setSelectedCategory(list?.first);

        return Padding(
          padding:const EdgeInsets.only(top: Dimens.paddingVertical),
          child: SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:list?.length??0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _controllerRestaurant.setSelectedCategory(list?[index]);
                  },
                  child: Observer(
                    builder: (context) {
                      return Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.paddingHorizontal),
                        decoration: BoxDecoration(
                          color: list?[index]?.id == _controllerRestaurant.selectedCategory?.id ? AppColors.colorAccent : null,
                          borderRadius: BorderRadius.circular(Dimens.borderRadius30),
                        ),
                        child: Center(
                          child: Text(
                            list?[index]?.categoryName??'',
                            style: TextStyle(
                                color:
                                list?[index].id == _controllerRestaurant.selectedCategory?.id ?  Colors.white : Colors.black,
                                fontSize:  list?[index]?.id == _controllerRestaurant.selectedCategory?.id ?  16 : 14),
                          ),
                        ),
                      );
                    }
                  ),
                );
              },
            ),
          ),
        );

  }
}
