class AnimalImage {
  final String url;

  AnimalImage({
    required this.url});

  factory AnimalImage.fromJson(Map<String, dynamic> json) {
    return AnimalImage(
      url: json['url'],
    );
  }
}