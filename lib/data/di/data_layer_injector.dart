import 'package:food_app/data/di/module/data_source_injector.dart';
import 'package:food_app/data/di/module/repository_injector.dart';

class DataLayerInjector{
  static Future<void> executeInjector() async {
    await DataSourceInjector.executeInjector();
    await RepositoryInjector.executeInjector();
  }
}