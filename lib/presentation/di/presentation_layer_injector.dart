import 'module/controller_injector.dart';

class PresentationLayerInjector {
  static Future<void> executeInjector() async {
    await ControllerInjector.executeInjector();
  }
}