import 'package:app_ong/api/cat_api.dart';
import 'package:flutter/material.dart';
import '../models/Dog.dart';
import '../models/cat.dart';
import 'details_screen.dart';


class ScreenCat extends StatefulWidget {
  const ScreenCat({Key? key}) : super(key: key);

  @override
  State<ScreenCat> createState() => _ScreenCatState();
}

class _ScreenCatState extends State<ScreenCat> {

  Future? cats;
  ApiServiceCat apiService = ApiServiceCat();

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
            List<Cat> catData = snapshot.data as List<Cat>;

            return ListView.builder(
              itemCount: catData.length,
              itemBuilder: (context, index) {
                return Card(
                  semanticContainer: true,
                  elevation: 5,
                  child: ListTile(
                    title: Text(catData[index].name),
                    minLeadingWidth: 50,
                    trailing: FutureBuilder(
                      future:
                      ApiServiceCat.getCatImageUrlByBreedId(catData[index].id),
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

  // TODO CRIAR UMA CLASSE ANIMAL E PASSAR PARAMETROS DAS DESCRIPTIONS
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
