
class DogImage {
  final String id;
  final String url;

  DogImage({required this.id, required this.url});

  factory DogImage.fromJson(Map<String, dynamic> json) {
    return DogImage(
      id: json['id'],
      url: json['url'],
    );
  }
}
