import 'package:flutter/material.dart';
import 'package:food_app/core/injector/injector_provider.dart';
import 'package:food_app/domain/entity/restaurant/entity_restaurant_item.dart';
import 'package:food_app/presentation/dashboard/controller/controller_cart.dart';
import 'package:food_app/presentation/dashboard/widget/cart_widget/widget_cart_single_item.dart';
import 'package:mobx/mobx.dart';

class WidgetCartItems extends StatefulWidget {

 const  WidgetCartItems({super.key});

  @override
  State<WidgetCartItems> createState() => _WidgetCartItemsState();
}

class _WidgetCartItemsState extends State<WidgetCartItems> {
  // final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ReactionDisposer _reactionDisposer;


  final _controllerCart = getIt<ControllerCart>();
  int _previousItemCount = 0; // Keeps track of the previous item count



  @override
  void initState() {
    super.initState();
    // Create a reaction to detect changes in the observable list
    _reactionDisposer = reaction<List<EntityRestaurantItem>>(
          (_) => _controllerCart.cartList.toList(), // Observe the list
          (newList) {
        // Check for additions or removals by comparing previous and new state
        for (int i = 0; i < newList.length; i++) {
          if (i >= _previousItemCount) {
            _listKey.currentState?.insertItem(i); // Notify about added item
          }
        }
        _previousItemCount = newList.length; // Update the previous item count
          },
    );
  }
  @override
  Widget build(BuildContext context) {


    return Column(
      children: _controllerCart.cartList.map((item)=>_buildItem(item)).toList(),
    );


    // return AnimatedList(
    //   physics:const NeverScrollableScrollPhysics(),
    //   key: _listKey,
    //   initialItemCount: _controllerCart.cartList.length,
    //   shrinkWrap: true,
    //   // To fit the list inside the scroll view
    //   itemBuilder: (context, index, animation) {
    //     return _buildItem(index,_controllerCart.cartList[index], animation);
    //   },
    // );
  }

  // Helper function to build each item with animation
  Widget _buildItem(
    EntityRestaurantItem item,
  ) {
    // final item= _controllerCart.cartList[index];
    return WidgetCartSingleItem(
          item: item,
          onRemoveItem: ()=>  _controllerCart.removeFromCart(item)
          ,
        )
    ;
  }
  // // Helper function to build each item with animation
  // Widget _buildItem(
  //     int index,
  //   EntityRestaurantItem item,
  //   Animation<double> animation,
  // ) {
  //   // final item= _controllerCart.cartList[index];
  //   return SizeTransition(
  //       sizeFactor: animation,
  //       child: WidgetCartSingleItem(
  //         item: item,
  //         onRemoveItem: ()=>removeItem(index,item),
  //       ));
  // }
removeItem(int index,EntityRestaurantItem item) {
  // String removedItem = _items.last; // احفظ العنصر الذي تريد إزالته
  // _items.removeAt(_items.length-1); // احذف العنصر من قائمة البيانات
  // final item= _controllerCart.cartList[index];

  // أبلغ AnimatedList بالحذف وقم بتشغيل الرسوم المتحركة
  _listKey.currentState!.removeItem(
    index,
    (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: WidgetCartSingleItem(
          item: item,
        )
      );
    },
    duration:const Duration(milliseconds: 300), // مدة الرسوم المتحركة
  );
  _controllerCart.removeFromCart(item);
}
}
