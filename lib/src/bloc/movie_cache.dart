
import 'package:blocflutter/src/models/item_model.dart';

class MovieCache {
  final _movieCache = <String, ItemModel>{};

  ItemModel get(String term) => _movieCache[term];

  void set(String term, ItemModel item) => _movieCache[term] = item;

  bool contains(String term) => _movieCache.containsKey(term);

  void remove(String term) => _movieCache.remove(term);
}