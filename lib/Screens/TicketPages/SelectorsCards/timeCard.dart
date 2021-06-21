import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_boc.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_events.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
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
  void initState() {
    super.initState();
    BlocProvider.of<TicketBloc>(context);
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
    }, 'Time', context.watch<TicketBloc>().getTime);
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

  List<Widget> timeChildren() => List.generate(
      TimeClass.timeList
          .where((element) => element.itemID == widget.item.id)
          .length,
      (index) => TextSelectorWidget(
          onTap: () {
            setState(() {
              BlocProvider.of<TicketBloc>(context)
                  .add(TimeSelectEvent(TimeClass.timeList[index].time));
              selectTimeTextIndex(index);
              Navigator.pop(context);
            });
          },
          text: TimeClass.timeList[index].time,
          isSelected: selectedTimeIndex == index));
}
