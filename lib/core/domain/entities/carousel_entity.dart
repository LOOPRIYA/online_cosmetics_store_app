class CarouselItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;

  CarouselItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  factory CarouselItem.fromJson(Map<String, dynamic> json) {
    return CarouselItem(
      imageUrl: json['imageUrl'],
      title: json['title'],
      subtitle: json['subtitle'],
      buttonText: json['buttonText'],
    );
  }
}