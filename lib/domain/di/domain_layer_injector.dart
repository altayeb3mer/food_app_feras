import 'package:food_app/domain/di/module/usecase_injector.dart';

class DomainLayerInjector{
  static Future<void> executeInjector() async {
    await UseCaseInjector.executeInjector();
    // await RepositoryInjector.executeInjector();
  }
}