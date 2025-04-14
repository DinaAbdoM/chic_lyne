class ProductEntity {
  final int id;
  final String title;
  final String? description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String? thumbnail;
  final List<String>? images;

  const ProductEntity({
    required this.id,
    required this.title,
     this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
     this.thumbnail,
     this.images,
  });
}