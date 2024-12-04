part of '../ui/screen_dashboard.dart';

class WidgetRestaurants extends StatelessWidget {
  final _controllerDashboard = getIt<ControllerDashboard>();
  final _controllerRestaurant = getIt<ControllerRestaurant>();

  WidgetRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingHorizontal,
          vertical: Dimens.paddingHorizontal),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Observer(builder: (context) {
          return _controllerDashboard.isLoadingRestaurant
              ? const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WidgetTitleText(title: 'Find restaurants'),
                    ...restaurantsList(context),
                  ],
                );
        }),
      ),
    );
  }

  restaurantsList(context) {
    return List.generate(_controllerDashboard.listRestaurant.length, (index) {
      return widgetRestaurantItem(
        _controllerDashboard.listRestaurant[index],
        context,
      );
    });
  }

  Widget widgetRestaurantItem(
      EntityRestaurant entityRestaurant, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.paddingHorizontal),
      child: InkWell(
        onTap: () {
          _controllerRestaurant.setSelectedRestaurant(entityRestaurant);
          RouteGenerator.navigateTo(
            routeName: AppRoutes.screenRestaurantMenu,
            args: ScreenArguments<ScreenRestaurantMenuArgs>(
              value:
                  ScreenRestaurantMenuArgs(entityRestaurant: entityRestaurant),
            ),
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                WidgetImage(
                  width: 100,
                  height: 80,
                  imageUrl: entityRestaurant.restaurantMainLogo ?? '',
                ),
                const SizedBox(
                  width: Dimens.paddingDefault,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetTitleTextSmall(
                          title: entityRestaurant.restaurantName ?? ''),
                      WidgetBodyText(
                          title: entityRestaurant.restaurantName ?? ''),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.local_taxi,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                  WidgetBodyText(
                                      title:
                                          entityRestaurant.deliveryFee ?? ''),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.pin_drop,
                                    size: 15,
                                  ),
                                  WidgetBodyText(
                                      title:
                                          entityRestaurant.deliveryFee ?? ''),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
