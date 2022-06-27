class Animal {
  dynamic id;
  String name;
  String? description;
  //String? url;

  Animal(
      {required this.id,
      required this.name,
      required this.description,
      //required this.url
      });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        //url: json['image']['url'],
    );
  }
}
