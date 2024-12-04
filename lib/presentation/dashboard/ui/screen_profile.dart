part of 'main_navigation.dart';

class ScreenProfile extends StatelessWidget with WidgetConfirmDialog {
  ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetTransparentAppbar(
        title: 'Profile',
        enableBackPress: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widgetUserInfo(),
            widgetDeliverTo(context),
            widgetRadiosLocations(),
            widgetTrackOrder(context),
            widgetChangeLanguage(),
            widgetLogout(),
          ],
        ),
      ),
    );
  }


  widgetDeliverTo(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingDefault, vertical: Dimens.paddingDefault),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetTitleTextSmall(title: 'Deliver To'),
              widgetAddLocationBtn(context),
            ],
          ),
        ],
      ),
    );
  }

  widgetTrackOrder(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.screenTrackOrder);
        },
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.delivery_dining),
                          SizedBox(
                            width: Dimens.padding5,
                          ),
                          WidgetBodyText(title: 'Track Order'),
                        ],
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.screenTrackOrder);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  widgetChangeLanguage() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
      child: InkWell(
        onTap: () {
          changeLang();
        },
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.language),
                          SizedBox(
                            width: Dimens.padding5,
                          ),
                          WidgetBodyText(title: 'Change Language'),
                        ],
                      )),
                  IconButton(
                      onPressed: () {
                        changeLang();
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  widgetLogout() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
      child: InkWell(
        onTap: () {
          showAppDialog(title: 'Logout', body: 'Sure to Logout ?',onConfirm: logout(),onCancel: (){});
        },
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: Dimens.padding5,
                          ),
                          WidgetBodyText(title: LocaleKeys.auth_screen_logout
                              .tr()),
                        ],
                      )),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  logout() {
    final storeAuth = getIt<StoreAuth>();
    storeAuth.logout();
  }

  changeLang() async {
    final navigatorKey = getIt<GlobalKey<NavigatorState>>();
    final ctx = navigatorKey.currentContext!;
    final localeFrom = ctx.locale.languageCode.toString();
    print('-------------from' + localeFrom);
    if (localeFrom == 'ar') {
      ctx.setLocale(const Locale('en', 'US'));
    } else {
      ctx.setLocale(const Locale('ar', 'SA'));
    }
    final localeTo = ctx.locale.languageCode.toString();
    print('-------------to' + localeTo);
  }

  widgetRadiosLocations() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.paddingDefault, vertical: Dimens.padding5),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            _rowItem('Riyadh (home)', '13'),
            _rowItem('Geddah (work)', '20', isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _rowItem(String title, String price, {bool isLast = false}) {
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
                    value: isLast ? '1' : '2',
                    groupValue: '2',
                    onChanged: (value) {},
                    title: WidgetBodyText(title: title),
                  )),
              IconButton(
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

  widgetAddLocationBtn(context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.screenAddLocation);
      },
      child: Container(
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
      ),
    );
  }

  widgetUserInfo() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.paddingDefault),
            child: CircleAvatar(
              radius: 60,
            ),
          ),
          WidgetTitleTextSmall(title: 'Altayeb Almubarak'),
          WidgetBodyText(title: '00966123456789'),
        ],
      ),
    );
  }
}
