class Product {
  String id;
  String imgPath;
  String name;
  String description;
  double price;
  bool isFavorited;

  Product({
    required this.id,
    required this.imgPath,
    required this.name,
    required this.description,
    required this.price,
    this.isFavorited = false,
  });
}
