class ItemClass {
  int? id;
  String name;
  String image;
  int attendsTotal;
  int attendsExpectedNo;
  int subscriberTotal;
  int subscriberExpectedNo;

  ItemClass(
      {this.id,
      required this.name,
      required this.image,
      required this.attendsTotal,
      required this.attendsExpectedNo,
      required this.subscriberTotal,
      required this.subscriberExpectedNo});

  static List<ItemClass> itemsList = [
    ItemClass(
        id: 1,
        name: 'RIYADH WINTER WONDERLAND',
        image: 'images/firstitem.png',
        attendsTotal: 2152125,
        attendsExpectedNo: 250,
        subscriberTotal: 902867,
        subscriberExpectedNo: 33),
    ItemClass(
        id: 2,
        name: 'HUNTED HOUSE Carnival',
        image: 'images/seconditem.png',
        attendsTotal: 1038980,
        attendsExpectedNo: 938,
        subscriberTotal: 2635410,
        subscriberExpectedNo: 333),
  ];
}
