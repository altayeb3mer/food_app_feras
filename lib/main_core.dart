import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/navigation/route_generator.dart';
import 'package:food_app/core/utilities/adapter_hive.dart';
import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/core/utilities/logging.dart';
import 'package:food_app/core/utilities/permissions_handler.dart';
import 'package:food_app/domain/entity/user/entity_user.dart';
import 'package:food_app/presentation/auth/controller/store_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

typedef FlavorCallback = FlavorConfig Function();

Future<void> initMain(FlavorCallback flavorCallback) async {
  flavorCallback();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


  await EasyLocalization.ensureInitialized();
  await InjectorProvider.initInjector();
  await PermissionsHandler.requestPermissions();
  AdapterHive.registerAdapters();


  final entityUser = await getIt<StoreAuth>().getSavedUser();
  Logging.info('test Logger-------------------${entityUser?.name}');
  runApp(
    EasyLocalization(
      startLocale: const Locale('en', 'US'),
      //TODO change to AR
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(
        entityUser: entityUser,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  EntityUser? entityUser;

  MyApp({required this.entityUser, super.key});

  final navigatorKey = getIt<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: AppMassager.scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.screenOnboarding,
      initialRoute: entityUser == null ? AppRoutes.login : AppRoutes.screenMain,
      onGenerateRoute: RouteGenerator.generateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
