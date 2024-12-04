import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant.dart';
import 'package:food_app/domain/usecases/restaurant/usecase_restaurant.dart';
import 'package:mobx/mobx.dart';

part 'controller_dashboard.g.dart';

class ControllerDashboard = _ControllerDashboard with _$ControllerDashboard;

abstract class _ControllerDashboard with Store {
  UseCaseRestaurant useCaseRestaurant;

  _ControllerDashboard({required this.useCaseRestaurant});

  @observable
  ObservableList<EntityRestaurant> listRestaurant =
      ObservableList<EntityRestaurant>();
  @observable
  ObservableFuture<List<EntityRestaurant>>? getRestaurantFuture;

  @computed
  bool get isLoadingRestaurant =>
      getRestaurantFuture?.status == FutureStatus.pending;

  @action
  Future<void> init() async {
    if(listRestaurant.isNotEmpty) return;
    getRestaurantFuture = ObservableFuture(getRestaurant());
    getRestaurantFuture?.then((list) {
      if (list.isNotEmpty) {
        listRestaurant.clear();
        listRestaurant.addAll(list);
      }
    }).catchError((e) {
      AppMassager.showError(e??'Error');
    });
  }

  Future<List<EntityRestaurant>> getRestaurant() async {
    return await useCaseRestaurant.getRestaurants();
  }

}
