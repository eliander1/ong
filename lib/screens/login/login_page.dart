import 'package:app_ong/screens/login/login_controller.dart';
import 'package:app_ong/widgets/ong_app_theme.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = TextEditingController();
  LoginController loginController = LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController.getEmailLogado(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) =>
         SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Container(
              color: OngAppTheme.mainColor,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/LoginOng.png', height: 200,),
                    emailTextField(),
                    ElevatedButton(
                      child:const Text('Quero Adotar!'),
                      onPressed: () {
                        loginController.validaEmail(context, _controllerEmail.text);
                      },
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Padding emailTextField() {
    return Padding(
      padding:const  EdgeInsets.only(left: 8, right: 8),
      child: TextField(
        controller: _controllerEmail,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
            contentPadding:const EdgeInsets.fromLTRB(32, 16, 32, 16),
            hintText: "Digite seu email cadastrado",
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
      ),
    );
  }
}
