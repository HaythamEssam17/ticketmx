import 'package:flutter/material.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';

class CommonTextFormFieldWidget {
  static TextFormField customTextFormField(
          {required TextEditingController controller,
          required String hintText,
          bool isToBorder = true,
          Function(String value)? onChanged,
          String? Function(String?)? validator}) =>
      TextFormField(
        controller: controller,
        style: TextStyles.blackBoldTextStyle(),
        onChanged: onChanged,
        validator: validator,
        textAlign: isToBorder ? TextAlign.start : TextAlign.center,
        decoration: InputDecoration(
            hintText: hintText,
            border: isToBorder ? UnderlineInputBorder() : InputBorder.none),
      );
}
