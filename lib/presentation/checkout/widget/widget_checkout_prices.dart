part of '../ui/screen_checkout.dart';


class WidgetCheckoutPrices extends StatelessWidget {
  const WidgetCheckoutPrices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.padding5),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            /*horizontal: Dimens.paddingDefault,*/
              vertical: Dimens.padding5),
          child: Column(
            children: [
              _rowItem('Sub Total', '13'),
              _rowItem('Shopping', '20'),
              _rowItem('Total', '20', isLast: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowItem(String title, String price, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetBodyText(title: title),
              WidgetBodyText(title: '$price \$'),
            ],
          ),
        ),
        Visibility(visible: !isLast, child: Divider())
      ],
    );
  }
}
