import 'package:app_ong/screens/list_animal/list_animal_repository.dart';

class ListAnimalController{
  Future? animal;
  ListAnimalRepository listAnimalRepository = ListAnimalRepository();

  void populateList(String animalSearch) {
    if(animalSearch == 'all'){
        animal = listAnimalRepository.getAllAnimals();
    }else if(animalSearch == 'dog'){
        animal = listAnimalRepository.getAllDogs();
    }else{
        animal = listAnimalRepository.getAllCats();
    }
  }

 

}