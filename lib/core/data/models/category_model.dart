class CategoryModel {
  final String? id;
  final String? name;
  final String? imageUrl;

  CategoryModel({this.id, this.name, this.imageUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?);
  }
}
