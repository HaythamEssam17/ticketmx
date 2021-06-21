import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_boc.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_events.dart';
import 'package:ticketmx_app/Classes/dateClass.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<TicketBloc>(context);
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
    }, 'Date', context.watch<TicketBloc>().getDate);
  }

  Widget customListTile(Function() onTap, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SharedText.screenHeight * 0.01),
      child: InkWell(
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
              BlocProvider.of<TicketBloc>(context)
                  .add(DateSelectEvent(DateClass.dateList[index].date));
              selectDateTextIndex(index);
              Navigator.pop(context);
            });
          },
          text: DateClass.dateList[index].date,
          isSelected: selectedDateIndex == index));
}
