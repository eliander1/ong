import 'dart:convert';
import 'package:app_ong/constants/api_constants.dart';
import 'package:app_ong/models/animal.dart';
import 'package:http/http.dart' as http;

class ListAnimalRepository{
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