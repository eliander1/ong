import 'package:flutter/material.dart';

class OngAppTheme{
  static final modelAppBar = AppBar(
     title: const Text(
    'CatDog, não compre adote!',
    style: TextStyle(fontFamily: mainFont),
     ),
    backgroundColor: mainColor,
  );


static const mainFont = "Poppins-Bold";
static final mainColor = Colors.indigo[800];
static const secondColor = Colors.green;


}


