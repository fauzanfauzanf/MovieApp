import 'dart:async';
import 'dart:convert';

import 'package:blocflutter/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

class MovieClient {
  final String baseUrl;
  final Client client;
  final _apiKey = 'dfe56ccc56c29a9beb179c7b11a1d6e4';

  MovieClient({
    Client client,
    this.baseUrl = "http://api.themoviedb.org/3/movie/popular?api_key=", 
  }) : this.client = client ?? Client();

  Future<ItemModel> loadItem() async {
    final response = await client.get(Uri.parse("$baseUrl$_apiKey"));
    final result = json.decode(response.body);

    print(result);
    if(response.statusCode == 200){
      return ItemModel.fromJson(result);
    } else {
      throw "Error no Data";
    }
  }
}