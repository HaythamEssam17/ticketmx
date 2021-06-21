import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_boc.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_states.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
import 'package:ticketmx_app/Classes/ticketClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Screens/TicketPages/SelectorsCards/categoryCard.dart';
import 'package:ticketmx_app/Screens/TicketPages/SelectorsCards/dateCard.dart';
import 'package:ticketmx_app/Screens/TicketPages/SelectorsCards/timeCard.dart';
import 'package:ticketmx_app/Screens/TicketPages/ticketHomePage.dart';
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
  String date = '';
  String time = '';
  String category = '';

  int generateCode() {
    int code = 0;
    var rng = new Random();
    List.generate(1, (_) {
      code = rng.nextInt(999999999) * 999999999;
    });

    return code;
  }

  void onButtonPressed() {
    if (date != '' && time != '' && category != '') {
      ticketClass.isAccepted = false;
      ticketClass.image = ticketClass.isAccepted
          ? 'images/truemark.png'
          : 'images/falsemark.png';
      ticketClass.title =
          ticketClass.isAccepted ? 'Ticket Accepted' : 'Ticket Rejected';
      ticketClass.id = 1;
      ticketClass.code = generateCode().toString();
      ticketClass.price = 0.0;
      ticketClass.date = date;
      ticketClass.time = time;
      ticketClass.category = category;

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

    BlocProvider.of<TicketBloc>(context).selectedDate = '';
    BlocProvider.of<TicketBloc>(context).selectedTime = '';
    BlocProvider.of<TicketBloc>(context).selectedCategory = '';
  }

  @override
  Widget build(BuildContext context) {
    date = context.watch<TicketBloc>().getDate;
    time = context.watch<TicketBloc>().getTime;
    category = context.watch<TicketBloc>().getCategory;

    return Scaffold(
      appBar: CommonAppBarWidget(title: widget.item.name, isWithLeading: true),
      endDrawer: CommonDrawerWidget(),
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
                background: Hero(
                    tag: '${widget.item.image}_ABC',
                    child: Image.asset(widget.item.image, fit: BoxFit.fill)),
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
                    // Date Widget
                    DateWidget(item: widget.item),
                    Divider(color: Colors.grey),

                    // Time Widget
                    TimeWidget(item: widget.item),
                    Divider(color: Colors.grey),

                    // Category Widget
                    CategoryWidget(item: widget.item),
                    Divider(color: Colors.grey),

                    // Attends-SubWidget
                    BlocBuilder<TicketBloc, TicketStates>(
                      builder: (context, state) {
                        if (date != '' && time != '' && category != '') {
                          return Column(
                            children: [
                              customAttendsAndSubWidget(
                                  widget.item.attendsExpectedNo,
                                  widget.item.subscriberExpectedNo),
                              Divider(color: Colors.grey),
                              SizedBox(height: SharedText.screenHeight * 0.025),
                            ],
                          );
                        }
                        return Text('');
                      },
                    ),

                    // Scan Button
                    CommonButtons.customButton(
                        onPressed: () {
                          onButtonPressed();
                        },
                        text: 'Scan Ticket',
                        iconData: LineariconsFree.frame_expand,
                        bgColor: date != '' && time != '' && category != ''
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
