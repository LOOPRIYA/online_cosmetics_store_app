class BannerModel {
  final String? id;
  final String? imageUrl;

  BannerModel({this.id, this.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
        id: json['id'] as String?, imageUrl: json['imageUrl'] as String?);
  }
}
