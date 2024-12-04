import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_divider.dart';
import 'package:food_app/core/widget/widget_image.dart';
import 'package:food_app/core/widget/widget_title_text.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant.dart';
import 'package:food_app/presentation/dashboard/controller/controller_dashboard.dart';
import 'package:food_app/presentation/restaurant/controller/controller_restaurant.dart';
import 'package:food_app/presentation/restaurant/ui/screen_restaurant_menu.dart';

part '../widget/widget_location.dart';

part '../widget/widget_hello_user.dart';

part '../widget/widget_carouse_slider.dart';

part '../widget/widget_restaurants.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {

  final _controllerDashboard = getIt<ControllerDashboard>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controllerDashboard.init();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const WidgetLocation(),
            const WidgetHelloUser(),
            WidgetCarouseSlider(),
            WidgetRestaurants(),
          ],
        ),
      ),
    );
  }
}
