import 'package:app_ong/api/web_client.dart';
import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../models/fonts_and_colors.dart';
import 'details_screen.dart';

class ScreenCat extends StatefulWidget {
  const ScreenCat({Key? key}) : super(key: key);
  @override
  State<ScreenCat> createState() => _ScreenCatState();
}

class _ScreenCatState extends State<ScreenCat> {
  var url = 'https://api.thecatapi.com/v1/images/search';
  Future? cats;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    populateList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cats,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Animal> catData = snapshot.data as List<Animal>;

            return ListView.builder(
              itemCount: catData.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      catData[index].name,

                      style: TextStyle(fontFamily: mainFont),
                    ),
                    leading: FutureBuilder(
                      future: ImageApi(urlTypePet: url.toString())
                          .getImageUrlByBreedId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String image = snapshot.data as String;
                          return Image.network(
                            image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          );
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
                    onTap: () => showDetails(context, catData[index]),
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
    cats = apiService.getAllCats();
  }

  void showDetails(BuildContext context, Animal catData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailsScreen(animal: catData, pet: url);
        },
      ),
    );
  }
}
