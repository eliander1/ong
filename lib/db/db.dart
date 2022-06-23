import 'dart:convert';
import 'dart:js_util/js_util_wasm.dart';

import 'package:flutter/material.dart';

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

class Teste extends StatelessWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('$jsonUsers')
    );
  }
}


