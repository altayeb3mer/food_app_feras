

import 'package:mobx/mobx.dart';

part 'main_nav_controller.g.dart';

class MainNavController = NavController with _$MainNavController;

abstract class NavController with Store {
  @observable
  int index = 0;

  @action
  void setNavIndex(int value) {
    index=value;
  }
}