import 'package:flutter/material.dart';
import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:food_app/domain/usecases/cart/usecase_cart.dart';
import 'package:food_app/presentation/dashboard/widget/cart_widget/widget_cart_single_item.dart';
import 'package:mobx/mobx.dart';

part 'controller_cart.g.dart';

class ControllerCart = _ControllerCart with _$ControllerCart;

abstract class _ControllerCart with Store {
  UseCaseCart useCaseCart;

  _ControllerCart({required this.useCaseCart});
  //
  // final GlobalKey<AnimatedListState> animatedListKey =
  //     GlobalKey<AnimatedListState>();

  @observable
  ObservableList<EntityRestaurantItem> cartList =
      ObservableList<EntityRestaurantItem>();
  @observable
  ObservableFuture<List<EntityRestaurantItem>?>? getCartFuture;

  @computed
  bool get isLoading => getCartFuture?.status == FutureStatus.pending;

  @action
  Future<void> init() async {
    getCartFuture = ObservableFuture(getCartItems());
    getCartFuture?.then((list) {
      if (list != null) {
        cartList.clear();
        cartList.addAll(list);
      }
    }).catchError((e) {
      AppMassager.showError(e ?? 'Error');
    });
  }

  @action
  Future<void> addToCart(EntityRestaurantItem item) async {
    await useCaseCart.save(item);
    cartList.add(item);
  }

  @action
  Future<void> removeFromCart(EntityRestaurantItem item) async {
    await useCaseCart.deleteItem(item).then((onValue) {
      cartList.remove(item);
    });
  }

  Future<List<EntityRestaurantItem>?> getCartItems() async {
    return useCaseCart.getCartData();
  }

  // //remove from
  // @action
  // removeItem(int index, EntityRestaurantItem item) {
  //   // String removedItem = _items.last; // احفظ العنصر الذي تريد إزالته
  //   // _items.removeAt(_items.length-1); // احذف العنصر من قائمة البيانات
  //   // final item= _controllerCart.cartList[index];
  //
  //   // أبلغ AnimatedList بالحذف وقم بتشغيل الرسوم المتحركة
  //   animatedListKey.currentState!.removeItem(
  //     index,
  //     (context, animation) {
  //       return SizeTransition(
  //           sizeFactor: animation,
  //           axis: Axis.vertical,
  //           child: WidgetCartSingleItem(
  //             item: item,
  //           ));
  //     },
  //     duration: const Duration(milliseconds: 300), // مدة الرسوم المتحركة
  //   );
  //   removeFromCart(item);
  // }
}
