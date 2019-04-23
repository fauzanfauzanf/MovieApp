
import 'package:blocflutter/src/bloc/bloc.dart';
import 'package:blocflutter/src/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListBloc extends StatefulWidget {
  final MovieRepository movieRepository;

  const MovieListBloc({Key key, @required this.movieRepository}) : super(key: key);

  @override
  _MovieListBlocState createState() => _MovieListBlocState();
}

class _MovieListBlocState extends State<MovieListBloc> {
  MovieBloc movieBloc;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

  @override
  void initState(){
    super.initState();
    movieBloc = MovieBloc(
      movieRepository: widget.movieRepository,
    );
    movieBloc.dispatch(LoadItemEvent());
  }

  @override
  void dispose(){
    movieBloc.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    movieBloc.dispatch(LoadItemEvent());
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      child: BlocBuilder(
        bloc: movieBloc,
        builder: (BuildContext context, MovieState state){
          if(state is MovieStateEmpty){
            return Center(
              child: Text('No Data'),
            );
          }

          if(state is LoadingMovieState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is LoadMovieError){
            return Center(child: Text(state.error));
          }

          if(state is LoadMovieSuccess){
            return RefreshIndicator(
              key: _refreshIndicatorKey,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int i){
                  return buildList(state.item.results[i]);
                },
                itemCount: state.item.results.length,
              ), 
              onRefresh: () {
                _onRefresh();
              },
            );
          }
        },
      ),
    );
  }

  Widget buildList(item){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'http://image.tmdb.org/t/p/w185${item.poster_path}',
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Release Date : ${item.release_date}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.02,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      item.overview,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        letterSpacing: -0.02,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}