import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
import 'package:ticketmx_app/Classes/ticketClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Screens/TicketPages/categoryCard.dart';
import 'package:ticketmx_app/Screens/TicketPages/dateCard.dart';
import 'package:ticketmx_app/Screens/TicketPages/ticketHomePage.dart';
import 'package:ticketmx_app/Screens/TicketPages/timeCard.dart';
import 'package:ticketmx_app/Widgets/commonAppBarWidget.dart';
import 'package:ticketmx_app/Widgets/commonButtons.dart';
import 'package:ticketmx_app/Widgets/commonDrawerWidget.dart';
import 'package:ticketmx_app/Widgets/commonFlutterToast.dart';
import 'package:ticketmx_app/Widgets/commonItemCard.dart';

class ItemDetailsPage extends StatefulWidget {
  final ItemClass item;

  const ItemDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  TicketClass ticketClass = TicketClass(1, true, '', '', '', '', '', '', 0.0);

  int generateCode() {
    int code = 0;
    var rng = new Random();
    List.generate(1, (_) {
      code = rng.nextInt(999999999) * 999999999;
    });

    return code;
  }

  void onButtonPressed() {
    if (SharedText.selectedDate.isNotEmpty &&
        SharedText.selectedTime.isNotEmpty &&
        SharedText.selectedCategory.isNotEmpty) {
      ticketClass.isAccepted = false;
      ticketClass.id = 1;
      ticketClass.code = generateCode().toString();
      ticketClass.title =
          ticketClass.isAccepted ? 'Ticket Accepted' : 'Ticket Rejected';
      ticketClass.price = 0.0;
      ticketClass.image = ticketClass.isAccepted
          ? 'images/truemark.png'
          : 'images/falsemark.png';

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TicketHomePage(ticketClass: ticketClass)));
    } else {
      CommonFlutterToast.customFlutterToast(
          'Please fill in all data', Colors.red);
    }
  }

  @override
  void initState() {
    super.initState();
    SharedText.selectedCategory = '';
    SharedText.selectedDate = '';
    SharedText.selectedTime = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(title: widget.item.name, isWithLeading: true),
      drawer: CommonDrawerWidget(),
      body: Container(
        height: SharedText.screenHeight,
        width: SharedText.screenWidth,
        color: Colors.grey[100],
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: SharedText.screenHeight * 0.35,
              floating: true,
              pinned: false,
              snap: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.pink,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.item.name,
                    textAlign: TextAlign.center,
                    style: TextStyles.buttonBoldTextStyle()),
                background: Image.asset(widget.item.image, fit: BoxFit.fill),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.all(SharedText.screenHeight * 0.025)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommonItemCard.counterColumn(
                      widget.item.attendsTotal, 'Attended'),
                  CommonItemCard.counterColumn(
                      widget.item.subscriberTotal, 'Subscriber'),
                ],
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.all(SharedText.screenHeight * 0.025)),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SharedText.screenWidth * 0.025),
                color: Colors.white,
                child: Column(
                  children: [
                    DateWidget(item: widget.item),
                    Divider(color: Colors.grey),
                    TimeWidget(item: widget.item),
                    Divider(color: Colors.grey),
                    CategoryWidget(item: widget.item),
                    Divider(color: Colors.grey),
                    if (SharedText.selectedDate.isNotEmpty &&
                        SharedText.selectedTime.isNotEmpty &&
                        SharedText.selectedCategory.isNotEmpty)
                      Column(
                        children: [
                          customAttendsAndSubWidget(
                              widget.item.attendsExpectedNo,
                              widget.item.subscriberExpectedNo),
                          Divider(color: Colors.grey),
                        ],
                      ),
                    SizedBox(height: SharedText.screenHeight * 0.025),
                    CommonButtons.customButton(
                        onPressed: () {
                          onButtonPressed();
                        },
                        text: 'Scan Ticket',
                        iconData: LineariconsFree.frame_expand,
                        bgColor: SharedText.selectedDate.isNotEmpty &&
                                SharedText.selectedTime.isNotEmpty &&
                                SharedText.selectedCategory.isNotEmpty
                            ? SharedText.mainColor
                            : SharedText.secondColor),
                    SizedBox(height: SharedText.screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customAttendsAndSubWidget(int attendCount, int subCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customRow(
            FontAwesome.ticket, Colors.orangeAccent, attendCount, 'Attended'),
        customRow(
            FontAwesome.ticket, SharedText.mainColor, subCount, 'Subscribers'),
      ],
    );
  }

  Row customRow(IconData iconData, Color iconColor, int count, String title) =>
      Row(
        children: [
          Icon(iconData, color: iconColor),
          Text(' ' + count.toString(),
              style: TextStyles.mainColorBoldTextStyle()),
          Text(' ' + title, style: TextStyles.mainColorBoldTextStyle()),
        ],
      );
}
