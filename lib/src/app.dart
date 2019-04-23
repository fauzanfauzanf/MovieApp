import 'package:blocflutter/src/bloc/movie_repository.dart';
import 'package:blocflutter/src/ui/movie_list_bloc.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final MovieRepository movieRepository;

  const App({Key key, @required this.movieRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MovieListBloc(movieRepository: movieRepository,),
        
      ),
    );
  }
}
