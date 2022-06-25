

class Cat {
  String id;
  String name;
  String description;
  //String image;

  Cat({
    required this.id,
    required this.name,
    required this.description,
    //required this.image
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      // image: json['url']
    );
  }
  @override
  String toString() {
    return
      'Cat: id=$id, '
          'name=$name, '
    //'image=$image'
        ;
  }
}

//existe um id dentro do breed e outro fora, caso de erro testar o outro.
