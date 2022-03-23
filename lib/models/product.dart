class Product {
  String id;
  String imgPath;
  String name;
  String color;
  String description;
  double price;
  bool isFavorited;
  bool isRecentlyViewed;

  Product({
    required this.id,
    required this.imgPath,
    required this.name,
    required this.color,
    required this.description,
    required this.price,
    this.isFavorited = false,
    this.isRecentlyViewed = false,
  });
}
