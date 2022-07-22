import 'dart:convert';

import 'package:belajar_rivepod/model_weather.dart';
import 'package:belajar_rivepod/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiRepo{///kelas yang akan menampung semua provider
  final url = 'https://api.airvisual.com/';
  final key = 'cb434807-b20b-4bcd-9174-2f95afb4fd43';

  Future<WeatherModel> fetchWeather() async{
    final response = await http.get(Uri.parse(url+'v2/city?city=Jakarta&state=Jakarta&country=Indonesia&key='+key));
    if(response.statusCode == 200){
      var res = json.decode(response.body);
      return WeatherModel.fromJson(res);
    }
    else{
      throw Exception('Ga Dapet Data');
    }
  }

  Future<UserModel> fetchUserModel(id) async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'+id));
    if(response.statusCode == 200){
      var res = json.decode(response.body);
      return UserModel.fromJson(res);
    }
    else{
      throw Exception('Ga Dapet Data');
    }
  }
}

final apiProvider = Provider((res) => ApiRepo());

final airData = FutureProvider<WeatherModel>((ref){
  final api = ref.watch(apiProvider);
  return api.fetchWeather(); 
});

///auto dispose for request new data every request
final detailUserData = FutureProvider.autoDispose.family<UserModel, String>((ref,id){
  final api = ref.watch(apiProvider);
  return api.fetchUserModel(id); 
});