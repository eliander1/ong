import 'package:app_ong/models/animal.dart';
import 'package:app_ong/screens/details/details_page.dart';
import 'package:app_ong/screens/list_animal/list_animal_controller.dart';
import 'package:flutter/material.dart';



class ListAnimalPage extends StatefulWidget {
  String animal;
   ListAnimalPage({Key? key,required this.animal}) : super(key: key);
  @override
  State<ListAnimalPage> createState() => _ListAnimalPageState();
}

class _ListAnimalPageState extends State<ListAnimalPage> {
  ListAnimalController listAnimalController = ListAnimalController(); 



  @override
  void initState() {
    super.initState();
      listAnimalController.populateList(widget.animal);
  }


  @override
  Widget build(BuildContext context) {
    listAnimalController.populateList(widget.animal);
    return FutureBuilder(
        future: listAnimalController.animal,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Animal> dogData = snapshot.data as List<Animal>;

            return ListView.builder(
              itemCount: dogData.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title:dogData[index].name != null ? Text(dogData[index].name!):Text('Sem nome'),
                    leading:dogData[index].image != null ? dogData[index].image!.url != null ?Image.network(
                            dogData[index].image!.url!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ):Icon(Icons.image): Icon(Icons.image),
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

          return const Center(child: CircularProgressIndicator());
        });
  }



  void showDetails(BuildContext context, Animal dogData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailsPage(
              animal: dogData,
             );
        },
      ),
    );

  }
}


