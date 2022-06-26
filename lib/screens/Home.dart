import 'package:app_ong/screens/screen_cat.dart';
import 'package:app_ong/screens/screen_dog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../api/web_client.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int index = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Future? dogs;
  ApiService apiService = ApiService();



  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(Icons.pets_outlined, size: 30), //colocar um image.asset dentro de Icon()
      Icon(Icons.monitor_heart, size: 30)];


    final telas = [
      ScreenCat(),
      ScreenDog()
    ];

    return Scaffold(
      extendBody: true,

      body: telas[index],

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        key: _bottomNavigationKey,
        items: items,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 200),
        index: index,
        onTap: (index) => setState(() {this.index = index;}),
      ),
    );

  }
}
