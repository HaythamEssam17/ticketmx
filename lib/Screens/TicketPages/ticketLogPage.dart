import 'package:flutter/material.dart';
import 'package:ticketmx_app/Classes/ticketLogClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Widgets/commonAppBarWidget.dart';
import 'package:ticketmx_app/Widgets/commonButtons.dart';
import 'package:ticketmx_app/Widgets/commonDrawerWidget.dart';
import 'package:ticketmx_app/Widgets/commonPaddingWidget.dart';
import 'package:ticketmx_app/Widgets/commonTextFormFieldWidget.dart';

import 'ticketLogDetailsCard.dart';

class TicketLogPage extends StatefulWidget {
  final TicketLogClass ticketLog;
  final bool isToSearch;

  const TicketLogPage(
      {Key? key, required this.ticketLog, required this.isToSearch})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TicketLogPageState();
}

class _TicketLogPageState extends State<TicketLogPage> {
  TextEditingController searchController = TextEditingController();
  String query = '';
  List<TicketLogDetailsClass> ticketDetailsList = [];

  @override
  void initState() {
    super.initState();
    ticketDetailsList = widget.ticketLog.detailsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(title: 'Ticket Log', isWithLeading: true),
      endDrawer: CommonDrawerWidget(),
      body: Container(
        child: Card(
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
                Expanded(child: detailsList()),
                CommonButtons.customButton(
                    onPressed: () {},
                    text: 'Back',
                    iconData: Icons.arrow_back_ios_rounded,
                    width: SharedText.screenWidth * 0.5,
                    bgColor: SharedText.mainColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titleColumn() {
    return Column(
      children: [
        Text('Ticket Log', style: TextStyles.titleBlackBoldTextStyle()),
        !widget.isToSearch
            ? Text(widget.ticketLog.code,
                style: TextStyles.smallGreyTextStyle())
            : CommonTextFormFieldWidget.customTextFormField(
                controller: searchController,
                hintText: 'Enter ticket code',
                isToBorder: false,
                onChanged: (value) {
                  setState(() {});
                }),
        SizedBox(height: SharedText.screenHeight * 0.02),
        MaterialButton(
          onPressed: () {
            setState(() {
              if (searchController.text.isNotEmpty) {
                ticketDetailsList = TicketLogDetailsClass.ticketLogDetailsList
                    .where((element) =>
                        element.code == searchController.text.trim())
                    .toList();
                print('not empty: ${ticketDetailsList.length}');
              } else {
                // ticketDetailsList = TicketLogDetailsClass.ticketLogDetailsList;
                // print('empty: ${ticketDetailsList.length}');
              }
            });
          },
          color: SharedText.mainColor,
          child: Text('Search', style: TextStyles.buttonBoldTextStyle()),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SharedText.screenWidth * 0.035)),
        )
      ],
    );
  }

  Widget detailsList() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SharedText.screenHeight * 0.02),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[100],
            child: ItemLogDetailsCard(itemDetails: ticketDetailsList[index]),
          );
        },
        shrinkWrap: true,
        itemCount: ticketDetailsList.length,
      ),
    );
  }
}
