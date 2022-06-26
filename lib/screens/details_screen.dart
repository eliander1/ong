import 'package:flutter/material.dart';
import '../api/web_client.dart';
import '../models/animal.dart';

class DetailsScreen extends StatelessWidget {

  final Animal animal;
  final String pet;

  DetailsScreen({required this.animal, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          FutureBuilder(
            future: ImageApi(typePet: pet).getImageUrlByBreedId(animal.id.toString()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String url = snapshot.data as String;
                return Image.network(
                  url,
                  height: 250,
                ); // image is ready
              } else {
                return new Container(
                  height: 250,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ); // placeholder
              }
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 24, 8, 8),
            child: Text(
              animal.name,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              animal.description ??

                  'Descrição não informada pelo dono',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}