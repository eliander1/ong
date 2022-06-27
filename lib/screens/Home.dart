import 'package:app_ong/screens/screen_all.dart';
import 'package:app_ong/screens/screen_cat.dart';
import 'package:app_ong/screens/screen_dog.dart';
import 'package:flutter/material.dart';
import '../models/text_models.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}
    int index = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final telas = [ScreenAll(), ScreenCat(), ScreenDog()];


    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                alignment: Alignment.centerLeft,
              ),
              filtrosAnimais('Todos os Pets', 0),
              filtrosAnimais('Gatos', 1),
              filtrosAnimais('Cachorro', 2),
            ],
          ),
        ),
      ),
      appBar: modelAppBar,
      body: telas[index],
    );
  }

  ListTile filtrosAnimais(String tipoAnimal, int indice) {
    return ListTile(
      leading: Icon(
        Icons.pets,
        color: mainColor,
      ),
      title: Text(tipoAnimal, style: TextStyle(fontFamily: mainFont),),
      onTap: () {
        setState((){
          index = indice;
          Navigator.pop(context);
        });
      },
    );
  }
}
