import 'package:flutter/material.dart';
import 'package:food_app/core/navigation/app_routes.dart';
import 'package:food_app/core/theme/app_colors.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_app_button.dart';
import 'package:food_app/core/widget/widget_body_text.dart';
import 'package:food_app/core/widget/widget_title_text_small.dart';
import 'package:food_app/core/widget/widget_transparent_appbar.dart';

part '../widget/widget_checkout_prices.dart';

class ScreenCheckout extends StatefulWidget {
  const ScreenCheckout({super.key});

  @override
  State<ScreenCheckout> createState() => _ScreenCheckoutState();
}

class _ScreenCheckoutState extends State<ScreenCheckout> {
  String radioLocationValue='1',radioPaymentValue='1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetTransparentAppbar(
          title: 'Checkout',
          enableBackPress: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.paddingDefault,
                vertical: Dimens.paddingDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widgetOrderDetails(),
                widgetDeliverTo(),
                widgetRadiosLocations(),
                widgetPaymentMethod(),
                WidgetCheckoutPrices(),
                const SizedBox(
                  height: Dimens.paddingVertical,
                ),
                WidgetAppButton(
                  title: 'Checkout',
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.screenTrackOrder);
                  },
                  horizontalPadding: 0,
                ),
              ],
            ),
          ),
        ));
  }

  widgetPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        WidgetTitleTextSmall(title: 'Payment Method'),
        widgetRadioListTile(title: 'Cash',value: '1'),
        widgetRadioListTile(title: 'Card',value: '2'),
        widgetRadioListTile(title: 'Apple Pay',value: '3'),
      ],
    );
  }

  widgetRadioListTile({required String title,required String value}) {
    return RadioListTile(
      value: value,
      groupValue: radioPaymentValue,
      onChanged: (value) {
        setState(() {
          radioPaymentValue=value??'';
        });
      },
      title: WidgetBodyText(title: title),
    );
  }

  widgetRadiosLocations() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.padding5),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            _rowItem('Current Location','1' ,currentLocation: true ),
            _rowItem('Riyadh (home)', '2'),
            _rowItem('Geddah (work)','3', isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _rowItem(String title,String radioValue, {bool isLast = false,bool currentLocation=false}) {
    return Column(
      children: [
        // RadioListTile(value: '1', groupValue: '1', onChanged: (value){},title:  WidgetBodyText(title: title),),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.paddingDefault,
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: RadioListTile(
                selected: isLast,
                value: radioValue,
                groupValue: radioLocationValue,
                onChanged: (value) {
                  setState(() {
                    radioLocationValue=radioValue;
                  });
                },
                title: WidgetBodyText(title: title),
              )),
             currentLocation?const SizedBox() : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    size: 20,
                  )),
            ],
          ),
        ),
        Visibility(visible: !isLast, child: Divider())
      ],
    );
  }

  widgetOrderDetails() {
    return Container(
      width: double.maxFinite,
      // height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.paddingDefault, vertical: Dimens.paddingDefault),
        child: Row(
          children: [
            Icon(
              Icons.shopping_cart,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Dimens.padding5,
            ),
            WidgetBodyText(title: '3 items: 20.0 \$'),
          ],
        ),
      ),
    );
  }

  widgetAddLocationBtn() {
    return Container(
      // height: 30,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.pin_drop,
              color: Colors.blue,
              size: 15,
            ),
            WidgetBodyText(title: 'Add Location'),
          ],
        ),
      ),
    );
  }

  widgetDeliverTo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.paddingDefault),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetTitleTextSmall(title: 'Deliver To'),
              widgetAddLocationBtn(),
            ],
          ),
        ],
      ),
    );
  }
}
