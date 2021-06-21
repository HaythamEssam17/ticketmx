class TimeClass {
  int? id;
  int itemID;
  String time;

  TimeClass({this.id, required this.time, required this.itemID});

  static List<TimeClass> timeList = [
    TimeClass(itemID: 1, id: 1, time: '01:00 PM'),
    TimeClass(itemID: 1, id: 2, time: '01:30 PM'),
    TimeClass(itemID: 1, id: 3, time: '02:00 PM'),
    TimeClass(itemID: 1, id: 4, time: '02:30 PM'),
    TimeClass(itemID: 1, id: 5, time: '03:00 PM'),
    TimeClass(itemID: 2, id: 6, time: '03:30 PM'),
    TimeClass(itemID: 2, id: 7, time: '04:00 PM'),
    TimeClass(itemID: 2, id: 8, time: '04:30 PM'),
    TimeClass(itemID: 2, id: 9, time: '05:00 PM'),
    TimeClass(itemID: 2, id: 10, time: '05:30 PM'),
    TimeClass(itemID: 2, id: 11, time: '06:00 PM'),
    TimeClass(itemID: 2, id: 12, time: '06:30 PM'),
  ];
}
