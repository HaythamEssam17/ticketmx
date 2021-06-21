import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';

class TextSelectorWidget extends StatefulWidget {
  final Function() onTap;
  final String text;
  final bool isSelected;

  const TextSelectorWidget(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.isSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextSelectorWidgetState();
}

class _TextSelectorWidgetState extends State<TextSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: SharedText.screenHeight * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text,
                style: widget.isSelected
                    ? TextStyles.redTextStyle()
                    : TextStyles.blackBoldTextStyle()),
            widget.isSelected
                ? Icon(FontAwesome.ok, color: SharedText.mainColor)
                : Icon(FontAwesome.ok, color: Colors.transparent)
          ],
        ),
      ),
    );
  }
}
