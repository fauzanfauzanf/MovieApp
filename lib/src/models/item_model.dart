import 'package:equatable/equatable.dart';

class ItemModel extends Equatable{
  final int page;
  final int total_results;
  final int total_pages;
  final List<Result> results;

  ItemModel({this.page, this.total_results, this.total_pages, this.results});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    var item = json['results'] as List;
    List<Result> result = new List<Result>();
    result = item.map((i) => Result.fromJson(i)).toList();

    return ItemModel(
      page: json['page'],
      total_results: json['total_results'],
      total_pages: json['total_pages'],
      results: result,
    );
  }
}

class Result extends Equatable{
  final int vote_count;
  final int id;
  final bool video;
  final double vote_average;
  final String title;
  final double popularity;
  final String poster_path;
  final String original_language;
  final String original_title;
  final List<int> genre_ids;
  final String backdrop_path;
  final bool adult;
  final String overview;
  final String release_date;

  Result({this.vote_count, this.id, this.video, this.vote_average, this.title, this.popularity, this.poster_path, this.original_language, this.original_title, this.genre_ids, this.backdrop_path, this.adult, this.overview, this.release_date});

  factory Result.fromJson(Map<String, dynamic> json){
    var genreId = json['genre_ids'] as List;
    List<int> genre = new List<int>();
    genre = genreId.cast<int>();

    return Result(
      vote_count: json['vote_count'],
      id: json['id'],
      video: json['video'],
      vote_average: json['vote_average'].toDouble(),
      title: json['title'],
      popularity: json['popularity'].toDouble(),
      poster_path: json['poster_path'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      genre_ids: genre,
      backdrop_path: json['backdrop_path'],
      adult: json['adult'],
      overview: json['overview'],
      release_date: json['release_date'],
    );
  }  
}