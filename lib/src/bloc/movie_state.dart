import 'package:blocflutter/src/models/item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieState extends Equatable{
  MovieState([List props = const[]]) : super(props);
}

class MovieStateEmpty extends MovieState {
  @override
  String toString() => 'MovieStateEmpty';
}

class LoadingMovieState extends MovieState {
  @override
  String toString() => 'Loading';
}

class LoadMovieSuccess extends MovieState {
  final ItemModel item;

  LoadMovieSuccess(this.item) : super([item]);
  
  @override
  String toString() => 'LoadMovieSuccess { item: ${item.results.length} }';
}

class LoadMovieError extends MovieState {
  final String error;

  LoadMovieError(this.error) : super([error]);

  @override
  String toString() => 'LoadMovieError';
} 
