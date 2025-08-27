class Product {
  final String image;
  final String title;
  final int price;
  final int originalPrice;
  final String discount;
  final double? rating;
  final int? reviews;

  const Product({
    required this.image,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.discount,
    this.rating,
    this.reviews,
  });
}