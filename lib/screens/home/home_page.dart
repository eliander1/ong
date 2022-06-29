import 'package:app_ong/widgets/filter_animal.dart';
import 'package:app_ong/widgets/ong_app_theme.dart';
import 'package:app_ong/screens/list_animal/list_animal_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
    
class _HomeState extends State<Home> {
     int index = 0;
  @override
  Widget build(BuildContext context) {
 
    final telas = [ListAnimalPage(animal: 'all'), ListAnimalPage(animal: 'cat'), ListAnimalPage(animal: 'dog')];

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
                icon: const Icon(Icons.arrow_back),
                alignment: Alignment.centerLeft,
              ),
              FilterAnimal(type:'Todos os Pets', function: () {
              setState((){
                index = 0;
                Navigator.pop(context);
              });
              }),
               FilterAnimal(type:'Gatos', function: () {
              setState((){
                index = 1;
                Navigator.pop(context);
              });
              }),
             FilterAnimal(type:'Cachorro', function: () {
              setState((){
                index = 2;
                Navigator.pop(context);
              });
              }),
            ],
          ),
        ),
      ),
      appBar: OngAppTheme.modelAppBar,
      body: telas[index],
    );
  }


  // Widget navigator(){
  //     if(index == 0){
  //       return ListAnimalPage(animal: 'all',);
  //     }
  // }

}
