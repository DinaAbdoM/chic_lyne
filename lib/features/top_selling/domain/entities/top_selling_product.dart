class TopSellingProduct {
  final int id;
  final String title;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String thumbnail;

  TopSellingProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.thumbnail,
  });
}