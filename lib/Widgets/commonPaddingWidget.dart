import 'package:flutter/material.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';

class CommonPaddingWidget {
  static EdgeInsetsGeometry padding() => EdgeInsets.symmetric(
      horizontal: SharedText.screenWidth * 0.025,
      vertical: SharedText.screenHeight * 0.02);
}
