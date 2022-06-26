import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/animal.dart';
import '../models/animal_image.dart';


Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Authorization': 'b832b6d8-0a31-4417-b359-c7966b99c84a'
};


class ApiService {
  Future<List<Animal>> getAllCats() async {
    final url = Uri.parse("https://api.thecatapi.com/v1/breeds");

    http.Response response = await http.get(
        url, headers: {"x-api-key": "b832b6d8-0a31-4417-b359-c7966b99c84a"}
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;

      return list.map((model) => Animal.fromJson(model)).toList();

    } else {
      throw Exception('Request to $url failed with status ${response.statusCode}: ${response.body}');
    }
  }


  Future<List<Animal>> getAllDogs() async {
    final url = Uri.parse("https://api.thedogapi.com/v1/breeds");
    http.Response response = await http.get(
        url, headers:  {HttpHeaders.acceptHeader: 'application/json'}
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body) as List;
      Iterable list = result;
      return list.map((model) => Animal.fromJson(model)).toList();

    } else {
      throw Exception('Request to $url failed with status ${response.statusCode}: ${response.body}');
    }
  }


}

class ImageApi{
  String typePet;
  ImageApi({required this.typePet});

  Future<String> getImageUrlByBreedId(String id) async {
    final response = await http.get(Uri.parse(typePet));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => AnimalImage.fromJson(model)).toList()[0].url;
    } else {
      throw Exception('Failed to load data! ${response.statusCode}: ${response.body}');
    }
  }

}