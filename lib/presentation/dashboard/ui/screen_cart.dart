part of 'main_navigation.dart';

class ScreenCart extends StatefulWidget {
  ScreenCart({super.key});

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  final _controllerCart = getIt<ControllerCart>();
  final _controllerRestaurant = getIt<ControllerRestaurant>();

  @override
  void initState() {
    // TODO: implement initState
    _controllerCart.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // _controllerCart.init();
    return Scaffold(
      appBar: WidgetTransparentAppbar(
        title: 'Cart',
        enableBackPress: false,
      ),
      body: Observer(builder: (context) {
        return _controllerCart.cartList.isEmpty
            ? Center(
                child: const Column(
                  children: [
                    Icon(
                      Icons.no_food,
                      size: 100,
                      color: Colors.grey,
                    ),
                    Text(
                      'اضف وجبتك لتظهر هنا',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    WidgetCartItems(),
                    const SizedBox(height: 10),
                    WidgetPrices(),
                    const SizedBox(height: 10),
                    WidgetAppButton(
                        title: 'Execute Order',
                        onPress: () {
                          Navigator.pushNamed(
                              context, AppRoutes.screenCheckout);
                        }),
                    WidgetAppButton(
                        buttonStyle: AppTextStyle.buttonStyleBlack(),
                        title: 'Add More',
                        onPress: () {
                          if (_controllerRestaurant.selectedRestaurant !=
                              null) {
                            RouteGenerator.navigateTo(
                              routeName: AppRoutes.screenRestaurantMenu,
                              args: ScreenArguments<ScreenRestaurantMenuArgs>(
                                value: ScreenRestaurantMenuArgs(
                                    entityRestaurant: _controllerRestaurant
                                        .selectedRestaurant!),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              );
      }),
    );
  }
}
