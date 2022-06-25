import 'package:flutter/material.dart';
import '../api/dog_api.dart';
import '../models/dog.dart';
import 'details_screen.dart';


class ScreenDog extends StatefulWidget {
  const ScreenDog({Key? key}) : super(key: key);

  @override
  State<ScreenDog> createState() => _ScreenDogState();
}

class _ScreenDogState extends State<ScreenDog> {

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
            List<Dog> dogData = snapshot.data as List<Dog>;

            return ListView.builder(
              itemCount: dogData.length,
              itemBuilder: (context, index) {
                return Card(
                  semanticContainer: true,
                  elevation: 5,
                  child: ListTile(
                    title: Text(dogData[index].name),
                    minLeadingWidth: 50,
                    trailing: FutureBuilder(
                      future:
                      apiService.getImageUrlByBreedId(dogData[index].id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String image = snapshot.data as String;
                          return Image.network(
                            image,
                            height: 100,
                            width: 100,
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
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  void populateList() {
    dogs = apiService.getAllDogs();
  }

  void showDetails(BuildContext context, Dog dogData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailsScreen(dog: dogData);
        },
      ),
    );

  }
}
