import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Screens/HomePages/itemDetailsPage.dart';

import 'commonButtons.dart';
import 'commonPaddingWidget.dart';

class CommonItemCard {
  static Widget customItemCard(BuildContext context, ItemClass item) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Column(
        children: [
          Hero(
            tag: '${item.image}_ABC',
            child: Image.asset(item.image,
                height: SharedText.screenHeight * 0.5,
                width: SharedText.screenWidth,
                fit: BoxFit.fill),
          ),
          SizedBox(height: SharedText.screenHeight * 0.025),
          Container(
            padding: CommonPaddingWidget.padding(),
            child: Column(
              children: [
                Text(item.name, style: TextStyles.titleBlackBoldTextStyle()),
                SizedBox(height: SharedText.screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    counterColumn(item.attendsTotal, 'Attended'),
                    counterColumn(item.subscriberTotal, 'Subscribers'),
                  ],
                ),
                SizedBox(height: SharedText.screenHeight * 0.05),
                CommonButtons.customButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemDetailsPage(item: item))),
                    text: 'Details',
                    iconData: FontAwesome5.info_circle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget counterWidget(int count) => Container(
        padding:
            EdgeInsets.symmetric(horizontal: SharedText.screenWidth * 0.02),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(SharedText.screenWidth * 0.1)),
        child: Text(count.toString(), style: TextStyles.greyTextStyle()),
      );

  static Widget counterColumn(int count, String text) => Column(
        children: [
          counterWidget(count),
          SizedBox(height: SharedText.screenHeight * 0.01),
          Text(text, style: TextStyles.greyTextStyle())
        ],
      );
}
