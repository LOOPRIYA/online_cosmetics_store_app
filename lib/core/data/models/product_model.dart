class ProductModel {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final double? oldPrice;
  final String? imageUrl;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.oldPrice,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price']?.toDouble(),
        oldPrice: json['oldPrice']?.toDouble(),
        imageUrl: json['imageUrl'] as String?);
  }
}
