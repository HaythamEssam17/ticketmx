import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:ticketmx_app/Classes/ticketClass.dart';
import 'package:ticketmx_app/Classes/ticketLogClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Widgets/commonAppBarWidget.dart';
import 'package:ticketmx_app/Widgets/commonButtons.dart';
import 'package:ticketmx_app/Widgets/commonDrawerWidget.dart';
import 'package:ticketmx_app/Widgets/commonPaddingWidget.dart';

import 'ticketLogPage.dart';

class TicketHomePage extends StatefulWidget {
  final TicketClass ticketClass;

  const TicketHomePage({Key? key, required this.ticketClass}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TicketHomePageState();
}

class _TicketHomePageState extends State<TicketHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
          title: widget.ticketClass.title, isWithLeading: true),
      endDrawer: CommonDrawerWidget(),
      body: Card(
        margin: CommonPaddingWidget.padding(),
        child: Container(
          padding: CommonPaddingWidget.padding(),
          height: SharedText.screenHeight,
          width: SharedText.screenWidth,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleColumn(),
              widget.ticketClass.isAccepted
                  ? acceptedColumn()
                  : rejectedColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleColumn() {
    return Column(
      children: [
        Image.asset(widget.ticketClass.image,
            fit: BoxFit.fill,
            height: SharedText.screenHeight * 0.25,
            width: SharedText.screenHeight * 0.25),
        SizedBox(height: SharedText.screenHeight * 0.02),
        Text(widget.ticketClass.title,
            style: TextStyles.titleBlackBoldTextStyle()),
        Text('TICKET NO: ' + widget.ticketClass.code,
            style: TextStyles.smallGreyTextStyle()),
      ],
    );
  }

  Widget acceptedColumn() {
    return Column(
      children: [
        Text('DATE: ' + widget.ticketClass.date,
            style: TextStyles.smallGreyTextStyle()),
        Text('Price: ' + widget.ticketClass.price.toString(),
            style: TextStyles.smallGreyTextStyle()),
        Text('CATEGORY: ' + widget.ticketClass.category,
            style: TextStyles.smallGreyTextStyle()),
        SizedBox(height: SharedText.screenHeight * 0.02),
        CommonButtons.customButton(
            onPressed: () {},
            text: 'Rescan',
            iconData: LineariconsFree.frame_expand,
            bgColor: SharedText.mainColor),
      ],
    );
  }

  Widget rejectedColumn() {
    return Column(
      children: [
        Text(
            'Attended Before ' +
                widget.ticketClass.date +
                ' - ' +
                widget.ticketClass.time,
            style: TextStyles.smallMainColorTextStyle()),
        MaterialButton(
          onPressed: () {
            TicketLogClass ticketLog = TicketLogClass(
                code: widget.ticketClass.code,
                detailsList: TicketLogDetailsClass.ticketLogDetailsList);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TicketLogPage(
                        ticketLog: ticketLog, isToSearch: false)));
          },
          child: Text('Check Ticket Log',
              style: TextStyles.smallMainColorTextStyle()),
          color: Color(0xffFBEBEB),
          elevation: 0.0,
          shape: StadiumBorder(),
        ),
        SizedBox(height: SharedText.screenHeight * 0.02),
        CommonButtons.customButton(
            onPressed: () {},
            text: 'Rescan',
            iconData: LineariconsFree.frame_expand,
            bgColor: SharedText.mainColor),
      ],
    );
  }
}
