import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_ong/models/dog.dart';
import '../models/dog_image.dart';


Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'b832b6d8-0a31-4417-b359-c7966b99c84a'
};







class ApiService {

  // Future<List<Dog>?> fetchDogs()async {
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'x-api-key': 'b832b6d8-0a31-4417-b359-c7966b99c84a'
  //
  //   };
  //   var request = http.MultipartRequest('GET',
  //       Uri.parse('https://api.thedogapi.com/v1/breeds'));
  //
  //   request.headers.addAll(headers);
  //
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //
  //   if (response.statusCode == 200) {
  //     final result = json.decode(response.body);
  //     Iterable list = result;
  //
  //     return list.map((model) => Dog.fromJson(model)).toList();
  //   }
  //   else {
  //     print('${response.reasonPhrase} ${response.statusCode}');
  //   }
  // }


///////////////////////////////////////////////////////////////////////////

  Future<List<Dog>> getAllDogs() async {
    final url = Uri.parse("https://api.thecatapi.com/v1/breeds");

    http.Response response = await http.get(
      url, headers: requestHeaders
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;
      //print(list);
      return list.map((model) => Dog.fromJson(model)).toList();

    } else {
      throw Exception('Request to $url failed with status ${response.statusCode}: ${response.body}');
    }
  }





  Future<String> getImageUrlByBreedId(String id) async {
    final response = await http.get(
        Uri.parse('https://api.thedogapi.com/v1/images/search'));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((model) => DogImage.fromJson(model)).toList()[0].url;
    } else {
      throw Exception('Failed to load data! ${response.statusCode}: ${response.body}');
    }
  }

}



// void findAll ()async{
//   var url = Uri.https(URL_BASE, parametro);
//   final http.Response reponse = await http.get(url);
//   print(reponse.body);
// }










// class DogApi {
//   Future<List<Dog>> findAllDogs() async {
//     var caminho = 'v1/images/search?limit=50&page=1&order=Desc';
//
//     // var parametro = {
//     //   //colcocar os parametros do json
//     // };
//
//     var url = Uri.https(URL_BASE, caminho);
//     http.Response response = await http.get(url);
//
//
//     final List<Map<String,dynamic>> responseMap = json.decode(response.body);
//
//     return responseMap.map<Dog>( (resp){
//
//     } ).toList();
//     return findAllDogs();
//   }
//   }