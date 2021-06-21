import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_boc.dart';
import 'package:ticketmx_app/Bloc/Ticket_Bloc/ticket_events.dart';
import 'package:ticketmx_app/Classes/categoryClass.dart';
import 'package:ticketmx_app/Classes/itemClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';
import 'package:ticketmx_app/Widgets/ItemWidgets/textSelectorPage.dart';
import 'package:ticketmx_app/Widgets/commonAlertDialogWidget.dart';

class CategoryWidget extends StatefulWidget {
  final ItemClass item;

  const CategoryWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int selectedCatIndex = 0;

  void selectedCatTextIndex(int index) {
    setState(() {
      if (selectedCatIndex == index)
        selectedCatIndex = 0;
      else
        selectedCatIndex = index;
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
        title: 'Category',
        subtitle: 'All Categories',
        children: categoryChildren(),
      );
    }, 'Category', context.watch<TicketBloc>().getCategory);
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

  List<Widget> categoryChildren() => List.generate(
      CategoryClass.categoryList
          .where((element) => element.itemID == widget.item.id)
          .length,
      (index) => TextSelectorWidget(
          onTap: () {
            setState(() {
              BlocProvider.of<TicketBloc>(context).add(
                  CategorySelectEvent(CategoryClass.categoryList[index].name));
              selectedCatTextIndex(index);
              Navigator.pop(context);
            });
          },
          text: CategoryClass.categoryList[index].name,
          isSelected: selectedCatIndex == index));
}
