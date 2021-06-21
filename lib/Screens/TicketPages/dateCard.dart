import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ticketmx_app/Classes/dateClass.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
import 'package:ticketmx_app/Classes/ticketClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Widgets/ItemWidgets/textSelectorPage.dart';
import 'package:ticketmx_app/Widgets/commonAlertDialogWidget.dart';

class DateWidget extends StatefulWidget {
  final ItemClass item;

  const DateWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  TicketClass ticketClass = TicketClass(1, true, '', '', '', '', '', '', 0.0);

  int selectedDateIndex = 1;

  void selectDateTextIndex(int index) {
    setState(() {
      if (selectedDateIndex == index)
        selectedDateIndex = 1;
      else
        selectedDateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return customListTile(() {
      CommonAlertDialogWidget.showAlertDialog(
        context: context,
        title: 'Date',
        subtitle: 'All Dates',
        children: dateChildren(),
      );
    }, 'Date', SharedText.selectedDate);
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

  List<Widget> dateChildren() => List.generate(
      DateClass.dateList
          .where((element) => element.itemID == widget.item.id)
          .length,
      (index) => TextSelectorWidget(
          onTap: () {
            setState(() {
              selectDateTextIndex(index);
              SharedText.selectedDate = DateClass.dateList[index].date;
              ticketClass.date = SharedText.selectedDate;
              Navigator.pop(context);
            });
          },
          text: DateClass.dateList[index].date,
          isSelected: selectedDateIndex == index));
}
