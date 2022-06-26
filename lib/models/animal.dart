class Animal {
  dynamic id;
  String name;
  String? description;
  String? temperament;

  Animal({
    required this.id,
    required this.name,
    required this.description,
    required this.temperament
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      temperament: json['temperament']
    );
  }
  @override
  String toString() {
    return
      'Animal: id=$id,'
          'name=$name, '
      //    'description=$description'

        ;
  }
}



