import 'package:app_ong/models/cat_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/cat.dart';

//TODO mudar tudo do dog pra cat

// Map<String, String> requestHeaders = {
//   'Content-type': 'application/json',
//   'Accept': 'application/json',
//   'Authorization': 'b832b6d8-0a31-4417-b359-c7966b99c84a'
// };


class ApiServiceCat {
  Future<List<Cat>> getAllCats() async {
    final url = Uri.parse("https://api.thecatapi.com/v1/breeds");

    http.Response response = await http.get(
        url, headers: {"x-api-key": "b832b6d8-0a31-4417-b359-c7966b99c84a"}
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;
      //print(list);
      return list.map((model) => Cat.fromJson(model)).toList();

    } else {
      throw Exception('Request to $url failed with status ${response.statusCode}: ${response.body}');
    }
  }

  Future<String> getCatImageUrlByBreedId(String id) async {
    final response = await http.get(
        Uri.parse('https://api.thecatapi.com/v1/images/search'));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => CatImage.fromJson(model)).toList()[0].url;
    } else {
      throw Exception('Failed to load data! ${response.statusCode}: ${response.body}');
    }
  }

}
