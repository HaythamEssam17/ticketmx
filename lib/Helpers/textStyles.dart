import 'package:flutter/material.dart';
import 'package:ticketmx_app/Utils/enums.dart';

import 'sharedText.dart';

class TextStyles {
  static TextStyle smallGreenBoldTextStyle() {
    return TextStyle(
        color: Colors.green,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 13.0 : 17.0);
  }
  static TextStyle smallRedBoldTextStyle() {
    return TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 13.0 : 17.0);
  }

  static TextStyle smallBlackBoldTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 13.0 : 16.0);
  }

  static TextStyle smallGreyTextStyle() {
    return TextStyle(
        color: Colors.grey,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 13.0 : 16.0);
  }

  static TextStyle smallMainColorTextStyle() {
    return TextStyle(
        color: SharedText.mainColor,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 13.0 : 16.0);
  }

  static TextStyle smallButtonBoldTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 13.0 : 16.0);
  }

  static TextStyle greyTextStyle() {
    return TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w900,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 15.0 : 19.0);
  }

  static TextStyle redTextStyle() {
    return TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w900,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 15.0 : 19.0);
  }

  static TextStyle greenTextStyle() {
    return TextStyle(
        color: Colors.green[700],
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 15.0 : 19.0);
  }

  static TextStyle mainColorBoldTextStyle() {
    return TextStyle(
        color: SharedText.mainColor,
        fontWeight: FontWeight.w900,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 15.0 : 19.0);
  }

  static TextStyle buttonBoldTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 15.0 : 19.0);
  }

  static TextStyle blackBoldTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 15.0 : 19.0);
  }

  static TextStyle titleButtonBoldTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 23.0 : 27.0);
  }

  static TextStyle titleBlackBoldTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 23.0 : 27.0);
  }

  static TextStyle titleGreyBoldTextStyle() {
    return TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 23.0 : 27.0);
  }

  static TextStyle titleMainColorBoldTextStyle() {
    return TextStyle(
        color: SharedText.mainColor,
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 23.0 : 27.0);
  }

  static TextStyle mediumRedColorBoldTextStyle() {
    return TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 20.0 : 24.0);
  }

  static TextStyle mediumMainColorBoldTextStyle() {
    return TextStyle(
        color: SharedText.mainColor,
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 20.0 : 24.0);
  }

  static TextStyle mediumButtonColorBoldTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: SharedText.deviceType == DeviceType.Mobile ? 20.0 : 24.0);
  }
}
