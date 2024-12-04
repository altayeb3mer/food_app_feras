// core/navigation/route_generator.dart

import 'package:flutter/material.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/utilities/logging.dart';
import 'package:food_app/core/utilities/screen_arguments.dart';
import 'package:food_app/presentation/auth/ui/screen_change_password.dart';
import 'package:food_app/presentation/auth/ui/screen_forgot_password.dart';
import 'package:food_app/presentation/auth/ui/screen_login.dart';
import 'package:food_app/presentation/auth/ui/screen_otp.dart';
import 'package:food_app/presentation/auth/ui/screen_sign_up.dart';
import 'package:food_app/presentation/checkout/ui/screen_checkout.dart';
import 'package:food_app/presentation/dashboard/ui/main_navigation.dart';
import 'package:food_app/presentation/itemdetails/ui/screen_item_details.dart';
import 'package:food_app/presentation/maps/ui/screen_add_location.dart';
import 'package:food_app/presentation/maps/ui/screen_edit_location.dart';
import 'package:food_app/presentation/onboarding/ui/screen_onboarding.dart';
import 'package:food_app/presentation/restaurant/ui/screen_restaurant_menu.dart';
import 'package:food_app/presentation/track_order/ui/screen_track_order.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => const ScreenLogin(), settings: settings);
      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (_) => const ScreenLogin(), settings: settings);
      case AppRoutes.signUp:
        return MaterialPageRoute(
            builder: (_) => const ScreenSignUp(), settings: settings);
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
            builder: (_) => ScreenForgotPassword(), settings: settings);
      case AppRoutes.screenChangePassword:
        return MaterialPageRoute(
            builder: (_) => ScreenChangePassword(), settings: settings);
      case AppRoutes.screenOtp:
        return MaterialPageRoute(
            builder: (_) => ScreenOtp(), settings: settings);
      case AppRoutes.screenMain:
        return MaterialPageRoute(
            builder: (_) => ScreenMain(), settings: settings);
      case AppRoutes.screenRestaurantMenu:
        return MaterialPageRoute(
            builder: (_) => const ScreenRestaurantMenu(), settings: settings);
      case AppRoutes.screenItemDetails:
        return MaterialPageRoute(
            builder: (_) => const ScreenItemDetails(), settings: settings);
      case AppRoutes.screenCheckout:
        return MaterialPageRoute(
            builder: (_) => const ScreenCheckout(), settings: settings);
      case AppRoutes.screenTrackOrder:
        return MaterialPageRoute(
            builder: (_) => const ScreenTrackOrder(), settings: settings);
      case AppRoutes.screenAddLocation:
        return MaterialPageRoute(
            builder: (_) => const ScreenAddLocation(), settings: settings);
      case AppRoutes.screenEditLocation:
        return MaterialPageRoute(
            builder: (_) => const ScreenEditLocation(), settings: settings);
        case AppRoutes.screenOnboarding:
        return MaterialPageRoute(
            builder: (_) => const ScreenOnboarding(), settings: settings);
      // Add more routes here
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR: Route not found'),
        ),
      );
    });
  }

  static dynamic navigateTo({required String routeName, dynamic? args}) async {
    try {
      final navigatorKey = getIt<GlobalKey<NavigatorState>>();
      final ctx = navigatorKey.currentContext!;
      Navigator.of(ctx).pushNamed(
        routeName,
        arguments: args,
      );
    } on Exception catch (e) {
      Logging.error('Routing error------------$e');
    }
  }
}
