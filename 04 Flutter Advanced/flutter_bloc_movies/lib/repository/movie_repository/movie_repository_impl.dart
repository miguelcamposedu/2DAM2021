import 'dart:convert';
import 'package:flutter_bloc_movies/models/movies/movies_response.dart';
import 'package:http/http.dart';
import '../constants.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final Client _client = Client();

  @override
  Future<List<Movie>> fetchMovies(String type) async {
    final response = await _client.get(Uri.parse('https://api.themoviedb.org/3/movie/$type?api_key=${Constant.apiKey}'));
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw Exception('Fail to load movies');
    }
  }
}