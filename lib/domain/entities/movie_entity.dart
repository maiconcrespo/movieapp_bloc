import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? posterPath;
  final int? id;
  final String? backdropPath;
  final String? title;
  final num? voteAverage;
  final String? releaseDate;
  final String? overview;
  MovieEntity({
    this.posterPath,
    this.id,
    this.backdropPath,
    this.title,
    this.voteAverage,
    this.releaseDate,
    this.overview,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        backdropPath,
        title,
        voteAverage,
        releaseDate,
        overview
      ];
  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'posterPath': posterPath,
      'id': id,
      'backdropPath': backdropPath,
      'title': title,
      'voteAverage': voteAverage,
      'releaseDate': releaseDate,
      'overview': overview,
    };
  }

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      posterPath: map['posterPath'],
      id: map['id'],
      backdropPath: map['backdropPath'],
      title: map['title'],
      voteAverage: map['voteAverage'],
      releaseDate: map['releaseDate'],
      overview: map['overview'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieEntity.fromJson(String source) =>
      MovieEntity.fromMap(json.decode(source));
}
