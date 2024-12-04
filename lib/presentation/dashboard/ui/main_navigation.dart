import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/navigation/route_generator.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/theme/text_style.dart';
import 'package:food_app/core/utilities/logging.dart';
import 'package:food_app/core/utilities/screen_arguments.dart';
import 'package:food_app/core/widget/widget_app_button.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_confirm_dialog.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';
import 'package:food_app/core/widget/widget_transparent_appbar.dart';
import 'package:food_app/generated/locale_keys.g.dart';
import 'package:food_app/presentation/auth/controller/store_auth.dart';
import 'package:food_app/presentation/dashboard/controller/controller_cart.dart';
import 'package:food_app/presentation/dashboard/controller/main_nav_controller.dart';
import 'package:food_app/presentation/dashboard/ui/screen_dashboard.dart';
import 'package:food_app/presentation/dashboard/widget/cart_widget/widget_cart_items.dart';
import 'package:food_app/presentation/dashboard/widget/cart_widget/widget_prices.dart';
import 'package:food_app/presentation/restaurant/controller/controller_restaurant.dart';
import 'package:food_app/presentation/restaurant/ui/screen_restaurant_menu.dart';

part 'screen_cart.dart';
part 'screen_profile.dart';
class ScreenMain extends StatefulWidget {
 const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final _navController = getIt<MainNavController>();

  final List<Widget> _pages = [
    const ScreenDashboard(),
     ScreenCart(),
     ScreenProfile(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
          builder: (context) {
            Logging.info('main nav rebuild------------');
            return IndexedStack(
                index: _navController.index,
                children: _pages);
          }
        ),
        bottomNavigationBar: Observer(
          builder: (context) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.black, // Custom background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimens.borderRadius30),
                  topRight: Radius.circular(Dimens.borderRadius30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Dimens.borderRadius30),
                  topRight: Radius.circular(Dimens.borderRadius30),
                ),
                child: navBtn(),
              ),
            );
          }
        ));
  }

  BottomNavigationBar navBtn() {
    return BottomNavigationBar(
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: AppColors.colorAccent,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _navController.setNavIndex(index),
        currentIndex: _navController.index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ]);
  }
}
