import 'package:flutter/material.dart';
import '../api/web_client.dart';
import '../models/animal.dart';
import '../models/botao_adotar.dart';
import '../models/text_models.dart';

class DetailsScreen extends StatelessWidget {
  final Animal animal;
  final String pet;

  DetailsScreen({required this.animal, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: modelAppBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: ImageApi(typePet: pet)
                  .getImageUrlByBreedId(animal.id.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String url = snapshot.data as String;
                  return Image.network(
                    url,
                    height: 250,
                    width: double.maxFinite,
                  ); // image is ready
                }
                return Center(
                  child: CircularProgressIndicator(),
                ); // placeholder
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 24, 8, 8),
              child: Text(
                animal.name,
                style: TextStyle(fontSize: 24, fontFamily: mainFont),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                animal.description ?? 'Descrição não informada pelo dono',
                style: TextStyle(fontSize: 16, fontFamily: mainFont),
              ),
            ),
            BotaoAdotar()
          ],
        ),
      ),
    );
  }
}
