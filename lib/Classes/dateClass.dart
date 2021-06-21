class DateClass {
  int? id;
  int itemID;
  String date;

  DateClass({this.id, required this.date, required this.itemID});

  static List<DateClass> dateList = [
    DateClass(itemID: 1, id: 1, date: '06-MAY-2021'),
    DateClass(itemID: 1, id: 2, date: '09-MAY-2021'),
    DateClass(itemID: 1, id: 3, date: '10-MAY-2021'),
    DateClass(itemID: 1, id: 4, date: '15-MAY-2021'),
    DateClass(itemID: 1, id: 5, date: '23-MAY-2021'),
    DateClass(itemID: 2, id: 6, date: '06-MAY-2021'),
    DateClass(itemID: 2, id: 7, date: '09-MAY-2021'),
    DateClass(itemID: 2, id: 8, date: '10-MAY-2021'),
  ];
}
