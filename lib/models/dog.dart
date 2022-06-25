

class Dog {
  dynamic id;
  String name;
  String description;
  //String image;

  Dog({
    required this.id,
    required this.name,
    required this.description,
    //required this.image
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
        id: json['id'],
      name: json['name'],
      description: json['description'],
    // image: json['url']
    );
  }
  @override
  String toString() {
    return
      'Dog: id=$id, '
      'name=$name, '
      //'image=$image'
    ;
  }
}

//existe um id dentro do breed e outro fora, caso de erro testar o outro.
