import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_sliver_appbar.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant.dart';
import 'package:food_app/generated/locale_keys.g.dart';
import 'package:food_app/presentation/dashboard/controller/main_nav_controller.dart';
import 'package:food_app/presentation/restaurant/controller/controller_restaurant.dart';
import 'package:food_app/presentation/restaurant/widget/widget_menu_list.dart';
import 'package:food_app/presentation/restaurant/widget/widget_menu_tab.dart';


part '../widget/widget_info_with_icon.dart';


class ScreenRestaurantMenuArgs {
  EntityRestaurant entityRestaurant;

  ScreenRestaurantMenuArgs({
    required this.entityRestaurant,
  });
}

class ScreenRestaurantMenu extends StatefulWidget {
  const ScreenRestaurantMenu({super.key});

  @override
  State<ScreenRestaurantMenu> createState() => _ScreenRestaurantMenuState();
}

class _ScreenRestaurantMenuState extends State<ScreenRestaurantMenu> {
  EntityRestaurant? entityRestaurant;
  final _controllerRestaurant = getIt<ControllerRestaurant>();



  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments;
    // if (args != null) {
    //   final screenArgs = args as ScreenArguments<ScreenRestaurantMenuArgs>;
    //   entityRestaurant = screenArgs.value?.entityRestaurant;
    // }
    entityRestaurant=_controllerRestaurant.selectedRestaurant;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          WidgetSliverAppbar(
            image: entityRestaurant?.restaurantMainLogo,
            actions: [
              IconButton(
                  onPressed: () {
                    final navController = getIt<MainNavController>();
                    navController.setNavIndex(1);
                    Navigator.pushNamed(context, AppRoutes.screenMain);
                  },
                  icon: const Icon(Icons.shopping_cart)),
            ],
            enableBackPress: true,
            screenContext: context,
          ),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingHorizontal,
                  vertical: Dimens.padding5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetTitleTextSmall(
                      title: entityRestaurant?.restaurantName ?? ''),
                  WidgetBodyText(
                      title: entityRestaurant?.restaurantDescription ?? ''),
                  WidgetInfoWithIcon(entityRestaurant: entityRestaurant!,),
                const WidgetMenuTab()
                ],
              ),
            ),
          ),

          WidgetMenuList(),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 60,
          ))

        ],
      ),
    );
  }
}
