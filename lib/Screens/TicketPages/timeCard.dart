import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
import 'package:ticketmx_app/Classes/ticketClass.dart';
import 'package:ticketmx_app/Classes/timeClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Widgets/ItemWidgets/textSelectorPage.dart';
import 'package:ticketmx_app/Widgets/commonAlertDialogWidget.dart';

class TimeWidget extends StatefulWidget {
  final ItemClass item;

  const TimeWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  TicketClass ticketClass = TicketClass(1, true, '', '', '', '', '', '', 0.0);

  int selectedTimeIndex = 1;

  void selectTimeTextIndex(int index) {
    setState(() {
      if (selectedTimeIndex == index)
        selectedTimeIndex = 1;
      else
        selectedTimeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return customListTile(() {
      CommonAlertDialogWidget.showAlertDialog(
        context: context,
        title: 'Time',
        subtitle: 'All times',
        children: timeChildren(),
      );
    }, 'Time', SharedText.selectedTime);
  }

  Widget customListTile(Function() onTap, String title, String subtitle) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyles.blackBoldTextStyle()),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(subtitle, style: TextStyles.blackBoldTextStyle()),
                Icon(FontAwesome.sort_down, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> timeChildren() => List.generate(
      TimeClass.timeList
          .where((element) => element.itemID == widget.item.id)
          .length,
          (index) => TextSelectorWidget(
          onTap: () {
            setState(() {
              selectTimeTextIndex(index);
              SharedText.selectedTime = TimeClass.timeList[index].time;
              ticketClass.time = SharedText.selectedTime;
              Navigator.pop(context);
            });
          },
          text: TimeClass.timeList[index].time,
          isSelected: selectedTimeIndex == index));
}
