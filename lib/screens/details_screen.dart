import 'package:flutter/material.dart';
import '../api/dog_api.dart';
import '../models/dog.dart';


class DetailsScreen extends StatelessWidget {

  final Dog dog;
  DetailsScreen({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          FutureBuilder(
            future: ApiService().getImageUrlByBreedId(dog.id),
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
              dog.name,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              dog.description,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}