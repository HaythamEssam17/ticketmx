import 'package:flutter/material.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Widgets/commonAppBarWidget.dart';
import 'package:ticketmx_app/Widgets/commonDrawerWidget.dart';
import 'package:ticketmx_app/Widgets/commonFadInWidget.dart';
import 'package:ticketmx_app/Widgets/commonItemCard.dart';
import 'package:ticketmx_app/Widgets/commonPaddingWidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(title: 'Home', isWithLeading: false),
      drawer: CommonDrawerWidget(),
      body: Container(
        height: SharedText.screenHeight,
        width: SharedText.screenWidth,
        color: Colors.white,
        padding: CommonPaddingWidget.padding(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return FadeInWidget(
              delay: index * 1.5,
              properties: CommonItemCard.customItemCard(
                  context, ItemClass.itemsList[index]),
            );
          },
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: ItemClass.itemsList.length,
        ),
      ),
    );
  }
}
