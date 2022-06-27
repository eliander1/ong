import 'package:app_ong/db/db.dart';
import 'package:app_ong/models/text_models.dart';
import 'package:app_ong/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class Login extends StatelessWidget {
  TextEditingController _controllerEmail = TextEditingController();
  var emailDigitado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/LoginOng.png', height: 200,),
              emailTextField(),
              ElevatedButton(
                child: Text('Quero Adotar!'),
                onPressed: () {
                  _validaEmail(context);
                },
              )
            ]),
      ),
    );
  }



  void _validaEmail(BuildContext context) {
      emailDigitado = _controllerEmail.text;
    if (jsonUsers.contains(emailDigitado) &&
        emailDigitado.contains("@") &&
        emailDigitado.length > 13) {
      Navigator.push(context, PageTransition(
          child: Home(), type: PageTransitionType.bottomToTop));

    } else {
      //TODO snackBar de email nao cadastrado
      debugPrint('$emailDigitado não ta no json');
      _controllerEmail.text = '';
    }
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
            hintText: "Digite seu email cadastrado",
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
      ),
    );
  }
}
