import 'package:bloc/bloc.dart';
import 'package:blocflutter/src/bloc/bloc.dart';
import 'package:blocflutter/src/bloc/movie_client.dart';
import 'package:blocflutter/src/bloc/movie_repository.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

void main() {
  final MovieRepository movieRepository = MovieRepository(
    MovieClient()
  );

  runApp(App(movieRepository: movieRepository,));
}
