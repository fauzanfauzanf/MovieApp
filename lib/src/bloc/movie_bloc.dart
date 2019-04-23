import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocflutter/src/bloc/movie_repository.dart';
import 'package:meta/meta.dart';
import './bloc.dart';
import 'movie_state.dart';
import 'movie_event.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc({@required this.movieRepository});

  @override
  Stream<MovieEvent> transform(Stream<MovieEvent> events){
    return (events as Observable<MovieEvent>)
      .debounce(Duration(milliseconds: 500));
  }

  @override
  void onTransition(Transition<MovieEvent, MovieState> transition){
    print(transition.toString());
  }

  @override
  MovieState get initialState => MovieStateEmpty();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event, 
  ) async* {
    if(event is LoadItemEvent){
      yield LoadingMovieState();
      try {
        final results = await movieRepository.loadItems();
        yield LoadMovieSuccess(results);
      } catch (e) {
        yield LoadMovieError(e.message);
        print(e.message);
      }
    }
  }
}
