class TicketLogClass {
  int? id;
  String code;
  List<TicketLogDetailsClass> detailsList;

  TicketLogClass({this.id, required this.code, required this.detailsList});
}

class TicketLogDetailsClass {
  int? id;
  String code;
  String ticketLogID;
  String status;
  bool isApproved;
  String date;
  String time;

  TicketLogDetailsClass(
      {this.id,
      required this.code,
      required this.ticketLogID,
      required this.status,
      required this.isApproved,
      required this.date,
      required this.time});

  static List<TicketLogDetailsClass> ticketLogDetailsList = [
    TicketLogDetailsClass(
        code: '23345345',
        ticketLogID: '1',
        status: 'Approved',
        isApproved: true,
        date: '22 May 2021',
        time: '4:00 PM'),
    TicketLogDetailsClass(
        code: '57649005',
        ticketLogID: '1',
        status: 'Rejected',
        isApproved: false,
        date: '23 May 2021',
        time: '7:00 PM'),
    TicketLogDetailsClass(
        code: '12352433',
        ticketLogID: '1',
        status: 'Approved',
        isApproved: true,
        date: '22 May 2021',
        time: '4:00 PM'),
    TicketLogDetailsClass(
        code: '01829227',
        ticketLogID: '1',
        status: 'Rejected',
        isApproved: false,
        date: '23 May 2021',
        time: '7:00 PM'),
    TicketLogDetailsClass(
        code: '12928423',
        ticketLogID: '1',
        status: 'Approved',
        isApproved: true,
        date: '22 May 2021',
        time: '4:00 PM'),
    TicketLogDetailsClass(
        code: '99273482',
        ticketLogID: '1',
        status: 'Rejected',
        isApproved: false,
        date: '23 May 2021',
        time: '7:00 PM'),
    TicketLogDetailsClass(
        code: '43647398',
        ticketLogID: '1',
        status: 'Approved',
        isApproved: true,
        date: '22 May 2021',
        time: '4:00 PM'),
    TicketLogDetailsClass(
        code: '21211762',
        ticketLogID: '1',
        status: 'Rejected',
        isApproved: false,
        date: '23 May 2021',
        time: '7:00 PM'),
  ];
}
