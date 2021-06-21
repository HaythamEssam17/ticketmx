import 'package:flutter/material.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Utils/enums.dart';

class CommonButtons {
  static MaterialButton customButton({
    required Function() onPressed,
    required String text,
    Color? bgColor,
    IconData? iconData,
    double? width,
  }) {
    Color color = bgColor ?? SharedText.mainColor;
    double? size = SharedText.deviceType == DeviceType.Mobile ? 20.0 : 40.0;
    double? minWidth = width ?? SharedText.screenWidth;

    return MaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconData != null) Icon(iconData, color: Colors.white, size: size),
          if (iconData != null) SizedBox(width: SharedText.screenWidth * 0.02),
          Text(text, style: TextStyles.buttonBoldTextStyle()),
        ],
      ),
      color: color,
      height: SharedText.screenHeight * 0.07,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SharedText.screenWidth * 0.035)),
    );
  }
}
