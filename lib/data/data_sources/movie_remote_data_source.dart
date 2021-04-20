import 'dart:convert';

import 'package:http/http.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/core/api_constraints.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  String urlTrending = '/3/trending/movie/day';
  String urlPopular = '/3/movie/popular';
  String urlComingSoon = '/3/movie/upcoming';
  String urlPlayingNow = '/3/movie/now_playing';

  Map<String, String>? headers = {'Content-Type': 'application/json'};

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get(urlTrending);
    final movies = MovieResultModel.fromJson(response).movies;
    //print('Trending$movies');
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get(urlPopular);
    final movies = MovieResultModel.fromJson(response).movies;
    //print('Popular$movies');
    return movies!;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get(urlComingSoon);
    final movies = MovieResultModel.fromJson(response).movies;
    // print('ComingSoon$movies');
    return movies!;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get(urlPlayingNow);
    final movies = MovieResultModel.fromJson(response).movies;
    //print('PlayingNow$movies');
    return movies!;
  }
}
