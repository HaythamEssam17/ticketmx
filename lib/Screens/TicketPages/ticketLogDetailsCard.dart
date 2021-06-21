import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:ticketmx_app/Classes/ticketLogClass.dart';
import 'package:ticketmx_app/Helpers/sharedText.dart';
import 'package:ticketmx_app/Helpers/textStyles.dart';

class ItemLogDetailsCard extends StatefulWidget {
  final TicketLogDetailsClass itemDetails;

  const ItemLogDetailsCard({Key? key, required this.itemDetails})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemLogDetailsCardState();
}

class _ItemLogDetailsCardState extends State<ItemLogDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Octicons.link_external, color: SharedText.mainColor),
      title: Text('Status: ' + widget.itemDetails.status,
          style: widget.itemDetails.isApproved
              ? TextStyles.smallGreenBoldTextStyle()
              : TextStyles.smallMainColorTextStyle()),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.itemDetails.date + ' - ' + widget.itemDetails.time,
              style: widget.itemDetails.isApproved
                  ? TextStyles.smallGreenBoldTextStyle()
                  : TextStyles.smallMainColorTextStyle()),
          Divider(),
        ],
      ),
    );
  }
}
