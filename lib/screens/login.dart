import 'package:flutter/material.dart';

TextEditingController _controllerEmail = TextEditingController();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "assets/images/catdog.png",
                  width: 200,
                  height: 150,
                ),
              ),
              emailTextField(),
              ElevatedButton(
                child: Text('Quero Adotar!'),
                onPressed: () {},
              )
            ]),
      ),
    );
  }



  Padding emailTextField() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        controller: _controllerEmail,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
            hintText: "Email",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32))),
      ),
    );
  }
}
