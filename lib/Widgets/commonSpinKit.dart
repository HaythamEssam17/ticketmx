import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Utils/enums.dart';

class CommonSpinKit {
  static Widget customSpinKitBounce() {
    return new SpinKitThreeBounce(
      size: SharedText.deviceType == DeviceType.Mobile ? 30.0 : 60.0,
      itemBuilder: (_, int index) {
        return DecoratedBox(
            decoration: BoxDecoration(color: SharedText.mainColor));
      },
    );
  }
}
