import 'package:flutter/material.dart';
import '../api/web_client.dart';
import '../models/animal.dart';
import 'details_screen.dart';


class ScreenAll extends StatefulWidget {
  const ScreenAll({Key? key}) : super(key: key);
  @override
  State<ScreenAll> createState() => _ScreenAllState();
}

class _ScreenAllState extends State<ScreenAll> {

  var url = 'https://api.thedogapi.com/v1/images/search';
  Future? dogs;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    populateList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dogs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Animal> dogData = snapshot.data as List<Animal>;

            return ListView.builder(
              itemCount: dogData.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(dogData[index].name),
                    leading: FutureBuilder(
                      future:
                      ImageApi(urlTypePet: url).getImageUrlByBreedId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String image = snapshot.data as String;
                          return Image.network(
                            image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ); // image is ready
                        } else {
                          return Container(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ); // placeholder
                        }
                      },
                    ),
                    onTap: () => showDetails(context, dogData[index]),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {

            return Center(
              child: Text('Error: ${snapshot.error}, ${snapshot.stackTrace}'),
            );
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  void populateList() {
    dogs = apiService.getAllAnimals();
  }

  void showDetails(BuildContext context, Animal dogData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailsScreen(
              animal: dogData,
              pet: url.toString());
        },
      ),
    );

  }
}


