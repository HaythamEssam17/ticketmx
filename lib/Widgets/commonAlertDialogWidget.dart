import 'package:flutter/material.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';

class CommonAlertDialogWidget {
  static showAlertDialog({
    required BuildContext context,
    required String title,
    required String subtitle,
    required List<Widget> children,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,
              textAlign: TextAlign.center,
              style: TextStyles.blackBoldTextStyle()),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SharedText.screenWidth * 0.05)),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: SharedText.screenWidth,
                    height: 1.0,
                    color: Colors.grey[200]),
                Text(subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyles.blackBoldTextStyle()),
                ListBody(
                  children: children,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
                width: SharedText.screenWidth,
                height: 1.0,
                color: Colors.grey[200]),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    elevation: 0.0,
                    height: SharedText.screenHeight * 0.05,
                    minWidth: SharedText.screenWidth * 0.3,
                    child: Text('OK', style: TextStyles.redTextStyle()),
                  ),
                ),
                Container(
                    width: 1.0,
                    height: SharedText.screenHeight * 0.07,
                    color: Colors.grey[200]),
                Expanded(
                  child: MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    elevation: 0.0,
                    height: SharedText.screenHeight * 0.05,
                    minWidth: SharedText.screenWidth * 0.3,
                    child: Text('Cancel', style: TextStyles.redTextStyle()),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
