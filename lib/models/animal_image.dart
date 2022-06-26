class AnimalImage {
  final String id;
  final String url;

  AnimalImage({required this.id, required this.url});

  factory AnimalImage.fromJson(Map<String, dynamic> json) {
    return AnimalImage(
      id: json['id'],
      url: json['url'],
    );
  }
}