
import 'package:flutter/material.dart';
import 'package:food_app/data/di/data_layer_injector.dart';
import 'package:food_app/domain/di/domain_layer_injector.dart';
import 'package:food_app/presentation/di/presentation_layer_injector.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final injector = getIt;


class InjectorProvider {
  static Future<void> initInjector() async {
    getIt.registerSingleton(GlobalKey<FormState>());
    getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
    await DataLayerInjector.executeInjector();
    await DomainLayerInjector.executeInjector();
    await PresentationLayerInjector.executeInjector();
  }
}
