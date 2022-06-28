import 'package:app_ong/db/db.dart';
import 'package:app_ong/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController{
   Future<void> validaEmail(BuildContext context,String emailDigitado) async {
    if (jsonUsers.contains(emailDigitado) &&
        emailDigitado.contains("@") &&
        emailDigitado.length > 13) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailDigitado);
      Navigator.push(context, PageTransition(
          child: const Home(), type: PageTransitionType.bottomToTop));

    } else {
      debugPrint('$emailDigitado não ta no json');
    }
  }


  getEmailLogado(BuildContext context) async {
     final prefs = await SharedPreferences.getInstance();
     final String? email =  prefs.getString('email');
     if(email != null){
          Navigator.push(context, PageTransition(
          child: const Home(), type: PageTransitionType.bottomToTop)); 
     }
  }
}