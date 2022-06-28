import 'package:app_ong/models/animal_image.dart';

class Animal {
  String? id;
  String? name;
  String? description;
  AnimalImage? image;

  Animal(
      {
      this.id,
      this.name,
      this.description,
      this.image});

  Animal.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    description = json['description'].toString();
    image = json['image'] != null ? new AnimalImage.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

