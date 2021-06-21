class CategoryClass {
  int? id;
  int itemID;
  String name;

  CategoryClass({this.id, required this.itemID, required this.name});

  static List<CategoryClass> categoryList = [
    CategoryClass(id: 1, itemID: 1, name: 'Entry Ticket'),
    CategoryClass(id: 2, itemID: 1, name: 'Gate B1'),
    CategoryClass(id: 3, itemID: 2, name: 'Entry Ticket'),
    CategoryClass(id: 4, itemID: 2, name: 'Gate B1'),
    CategoryClass(id: 5, itemID: 2, name: 'High Horror'),
  ];
}
