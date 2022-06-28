import 'package:app_ong/api/web_client.dart';

class ListAnimalController{
  var url = 'https://api.thedogapi.com/v1/images/search';
  Future? animal;
  ApiService apiService = ApiService();

  void populateList(String animalSearch) {
    if(animalSearch == 'all'){
      print(animalSearch);
        animal = apiService.getAllAnimals();
    }else if(animalSearch == 'dog'){
        print(animalSearch);
        animal = apiService.getAllDogs();
    }else{
         print(animalSearch);
        animal = apiService.getAllCats();
    }
  }

 

}