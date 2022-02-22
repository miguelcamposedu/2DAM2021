

import 'package:flutter_bloc_movies/models/movies/movies_response.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchMovies(String type);
}