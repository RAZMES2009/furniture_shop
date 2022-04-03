class Product {
  final String? id;
  final String? imgPath;
  final String? name;
  final String? color;
  final String? description;
  final double? price;
  final double? grade;
  final int? reviews;
  bool isFavorited;
  bool isOrder;

  Product({
    this.id,
    this.imgPath,
    this.name,
    this.color,
    this.description,
    this.price,
    this.grade,
    this.reviews,
    this.isFavorited = false,
    this.isOrder = false,
  });
}
