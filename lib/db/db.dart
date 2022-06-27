import 'dart:convert';

class User{
  String email;
  User(this.email);

  Map toJson() => {
    'email' : email
  };
}

List users = [
  'camposeliander@gmail.com',
  'teste@gmail.com',
];

final jsonUsers = jsonEncode(users);





