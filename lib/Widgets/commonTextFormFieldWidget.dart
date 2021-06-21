import 'package:flutter/material.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';

class CommonTextFormFieldWidget {
  static TextFormField customTextFormField(
          {required TextEditingController controller,
          required String hintText,
          Function(String value)? onChanged}) =>
      TextFormField(
        controller: controller,
        style: TextStyles.blackBoldTextStyle(),
        onChanged: onChanged,
        decoration: InputDecoration(hintText: hintText),
      );
}
