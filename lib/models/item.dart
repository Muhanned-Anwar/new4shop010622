class Item {
  int id;
  String title;
  String imagePath;
  late double price;
  late int number;
  late bool discount;

  Item({
    required this.id,
    required this.title,
    required this.imagePath,
    this.price = 5.53,
    this.number = 1,
    this.discount = false,
  });
}
