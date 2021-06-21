import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:ticketmx_app/Classes/ticketLogClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Screens/HomePages/homePage.dart';
import 'package:ticketmx_app/Screens/SplashPages/splashScreen.dart';
import 'package:ticketmx_app/Screens/TicketPages/ticketLogPage.dart';

class CommonDrawerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommonDrawerWidgetState();
}

class _CommonDrawerWidgetState extends State<CommonDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          height: SharedText.screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffF3B900), Color(0xffE95E52)],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: SharedText.screenHeight * 0.05),
              Image.asset('images/logo2.png',
                  height: SharedText.screenHeight * 0.1),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      customListTile(
                          LineariconsFree.home,
                          'Home',
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()))),
                      customListTile(
                          FontAwesome.info_circled,
                          'About Us',
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()))),
                      customListTile(
                          FontAwesome.search,
                          'Ticket Log',
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TicketLogPage(
                                      ticketLog: TicketLogClass(
                                          code: '', detailsList: []),
                                      isToSearch: true)))),
                      customListTile(
                          FontAwesome.logout,
                          'Log Out',
                          () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customListTile(IconData iconData, String title, Function() onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(iconData, color: Colors.white),
      title: Text(title, style: TextStyles.smallButtonBoldTextStyle()),
      subtitle: Divider(color: Colors.white, thickness: 0.25),
    );

    // return Container(
    //   padding: EdgeInsets.symmetric(
    //       vertical: SharedText.screenHeight * 0.01,
    //       horizontal: SharedText.screenWidth * 0.02),
    //   child: Row(
    //     children: [
    //       Icon(iconData, color: Colors.white),
    //       Column(
    //         children: [
    //           Text(title, style: TextStyles.smallButtonBoldTextStyle()),
    //           Divider(color: Colors.white),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
