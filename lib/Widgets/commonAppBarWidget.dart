import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Screens/HomePages/homePage.dart';
import 'package:ticketmx_app/Utils/enums.dart';

class CommonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool isWithLeading;

  const CommonAppBarWidget(
      {Key? key, required this.title, required this.isWithLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.buttonBoldTextStyle(),
      ),
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: isWithLeading,
      backgroundColor: SharedText.mainColor,
      leadingWidth: SharedText.screenWidth * 0.25,
      leading: isWithLeading
          ? IconButton(
              icon: Row(
                children: [
                  Icon(Icons.arrow_back_ios,
                      color: Colors.white,
                      size: SharedText.deviceType == DeviceType.Mobile
                          ? 20.0
                          : 40.0),
                  Text('Back', style: TextStyles.buttonBoldTextStyle()),
                ],
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            )
          : null,
      actions: [
        IconButton(
            onPressed: () {
              // Scaffold.of(context).openDrawer();
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(LineariconsFree.menu,
                color: Colors.white,
                size: SharedText.deviceType == DeviceType.Mobile ? 25.0 : 50.0))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
