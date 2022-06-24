import 'dart:convert';

class User{
  String email;
  User(this.email);

  Map toJson() => {
    'email' : email
  };
}

List users = [
  'eliander@gmail.com',
  'teste@gmail.com',
  'confi@no.pai'
];

final jsonUsers = jsonEncode(users);





