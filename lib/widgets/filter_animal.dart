import 'package:app_ong/widgets/ong_app_theme.dart';
import 'package:flutter/material.dart';

class FilterAnimal extends StatelessWidget{
  String? type;
  Function? function;

  FilterAnimal({Key? key, this.type,this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.pets,
        color: OngAppTheme.mainColor,
      ),
      title: Text(type!, style:const TextStyle(fontFamily: OngAppTheme.mainFont),),
      onTap:(){function;},
    );
  }

}