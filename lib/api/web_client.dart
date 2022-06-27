import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/animal.dart';
import '../models/animal_image.dart';

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Authorization': 'b832b6d8-0a31-4417-b359-c7966b99c84a'
};

const String urlCatBreed = "https://api.thecatapi.com/v1/breeds";
const String urlDogBreed = "https://api.thedogapi.com/v1/breeds";

class ApiService {
  Future<List<Animal>> getAllCats() async {
    final url = Uri.parse(urlCatBreed);
    http.Response response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => Animal.fromJson(model)).toList();
    } else {
      throw Exception(
          'Request to $url failed with status ${response.statusCode}: ${response.body}');
    }
  }

  Future<List<Animal>> getAllDogs() async {
    final url = Uri.parse(urlDogBreed);
    http.Response response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      final result = json.decode(response.body) as List;
      Iterable list = result;
      return list.map((model) => Animal.fromJson(model)).toList();
    } else {
      throw Exception(
          'Request to $url failed with status ${response.statusCode}: ${response.body}');
    }
  }

  Future<List<Animal>> getAllAnimals() async {
    final urlDog = Uri.parse(urlDogBreed);
    http.Response responseDog = await http.get(urlDog, headers: requestHeaders);

    final resultDog = json.decode(responseDog.body) as List;
    final urlCat = Uri.parse(urlCatBreed);
    http.Response response = await http.get(urlCat, headers: requestHeaders);
    final resultCat = json.decode(response.body);
    final allResult = (resultDog + resultCat);

    return allResult.map((model) => Animal.fromJson(model)).toList();
  }
}

class ImageApi {
  String urlTypePet;

  ImageApi({required this.urlTypePet});

  Future<String> getImageUrlByBreedId() async {
    final response = await http.get(Uri.parse(urlTypePet));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => AnimalImage.fromJson(model)).toList()[0].url;
    } else {
      throw Exception(
          'Failed to load data! ${response.statusCode}: ${response.body}');
    }
  }
}
