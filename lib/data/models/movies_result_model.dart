import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:movieapp/data/models/movie_model.dart';

class MovieResultModel {
  final List<MovieModel>? movies;

  MovieResultModel({
    required this.movies,
  });

  MovieResultModel copyWith({
    List<MovieModel>? results,
  }) {
    return MovieResultModel(
      movies: results ?? this.movies,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': movies!.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieResultModel.fromMap(Map<String, dynamic> map) {
    return MovieResultModel(
      movies: List<MovieModel>.from(
          map['results']?.map((x) => MovieModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieResultModel.fromJson(String source) =>
      MovieResultModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieResultModel(, results: $movies,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieResultModel && listEquals(other.movies, movies);
  }

  @override
  int get hashCode {
    return movies.hashCode;
  }
}
