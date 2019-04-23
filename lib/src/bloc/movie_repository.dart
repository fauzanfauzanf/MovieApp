

import 'package:blocflutter/src/bloc/movie_client.dart';
import 'package:blocflutter/src/models/item_model.dart';

class MovieRepository {
  final MovieClient client;

  MovieRepository(this.client);

  Future<ItemModel> loadItems() async {
    final result = await client.loadItem();
    return result;
  }
}