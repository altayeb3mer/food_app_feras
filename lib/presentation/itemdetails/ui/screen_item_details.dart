import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_sliver_appbar.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';
import 'package:food_app/presentation/dashboard/controller/controller_cart.dart';
import 'package:food_app/presentation/dashboard/controller/main_nav_controller.dart';
import 'package:food_app/presentation/itemdetails/widget/widget_additions.dart';
import 'package:food_app/presentation/itemdetails/widget/widget_bread_choice.dart';
import 'package:food_app/presentation/itemdetails/widget/widget_quantity.dart';
import 'package:food_app/presentation/restaurant/controller/controller_restaurant.dart';
import 'package:food_app/presentation/restaurant/widget/widget_add_to_cart.dart';

class ScreenItemDetails extends StatefulWidget {
  const ScreenItemDetails({super.key});

  @override
  State<ScreenItemDetails> createState() => _ScreenItemDetailsState();
}

class _ScreenItemDetailsState extends State<ScreenItemDetails> {
  final _controllerRestaurant = getIt<ControllerRestaurant>();
  final _controllerCart = getIt<ControllerCart>();

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments;
    // if (args != null) {
    //   final screenArgs = args as String;
    // }
    return Scaffold(
        body: Observer(
          builder: (context) {
            return CustomScrollView(
                  slivers: [
            WidgetSliverAppbar(
              image:
                 _controllerRestaurant.selectedItem?.imageBanner??'',
              actions: [
                IconButton(
                  onPressed: () {
                    final navController = getIt<MainNavController>();
                    navController.setNavIndex(1);
                    Navigator.pushNamed(context, AppRoutes.screenMain);

                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
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
                        WidgetTitleTextSmall(title: _controllerRestaurant.selectedItem?.itemName??''),
                        WidgetTitleTextSmall(
                          title: '${_controllerRestaurant.selectedItem?.price??''} \$',
                          color: AppColors.primaryColor,
                        ),
                        WidgetBodyText(
                            title:
                            _controllerRestaurant.selectedItem?.itemDescription??''),
                        WidgetQuantity(),
                        WidgetBreadChoice(),
                        WidgetAdditions(),
                        WidgetAddToCartBtn(
                          title: 'Add To Cart',
                          price: '10',
                          onPress: () {
                            final itemAddedBefore = _controllerCart.cartList.where((item)=>item.id==_controllerRestaurant.selectedItem?.id).toList().isNotEmpty;
                            if(itemAddedBefore==true){
                              AppMassager.showInfo('Item Added before');
                            }else{
                              _controllerCart.addToCart(_controllerRestaurant.selectedItem!);
                              AppMassager.showSuccess('Done');

                            }

                          },
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ))),
                  ],
                );
          }
        ));
  }
}
