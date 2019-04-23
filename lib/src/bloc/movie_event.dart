import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieEvent extends Equatable {
  MovieEvent([List props = const[]]) : super(props);
}

class LoadItemEvent extends MovieEvent {}