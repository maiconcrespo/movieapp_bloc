import 'dart:convert';

import 'package:movieapp/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  final String? backdropPath;
  //final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final String? posterPath;
  final bool? video;
  final double? voteAverage;
  final int? id;
  final String? overview;
  final String? releaseDate;
  final int? voteCount;
  final String? title;
  final double? popularity;
  final String? mediaType;
  MovieModel({
    this.title,
    this.adult,
    this.backdropPath,
    // this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.voteAverage,
    this.id,
    this.overview,
    this.releaseDate,
    this.voteCount,
    this.popularity,
    this.mediaType,
  });

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdropPath': backdropPath,
      //'genreIds': genreIds,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'posterPath': posterPath,
      'video': video,
      'voteAverage': voteAverage,
      'id': id,
      'overview': overview,
      'releaseDate': releaseDate,
      'voteCount': voteCount,
      'title': title,
      'popularity': popularity,
      'mediaType': mediaType,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      //genreIds: List<int>.from(map['genreIds']),
      // genreIds: map['genreIds'].cast<int>(),
      originalLanguage: map['original_language'],
      originalTitle: map['original_Title'],
      posterPath: map['poster_path'],
      video: map['video'],
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      id: map['id'],
      overview: map['overview'],
      releaseDate: map['release_date'],
      voteCount: map['vote_count'],
      title: map['title'],
      popularity: map['popularity']?.toDouble() ?? 0.0,
      mediaType: map['media_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
