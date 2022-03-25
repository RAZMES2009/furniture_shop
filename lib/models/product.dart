class Product {
  String id;
  String imgPath;
  String name;
  String color;
  String description;
  double price;
  double grade;
  int reviews;
  bool isFavorited;
  bool isRecentlyViewed;

  Product({
    required this.id,
    required this.imgPath,
    required this.name,
    required this.color,
    required this.description,
    required this.price,
    required this.grade,
    required this.reviews,
    this.isFavorited = false,
    this.isRecentlyViewed = false,
  });
}
