import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_movies/models/movies/movies_response.dart';
import 'package:flutter_bloc_movies/repository/movie_repository/movie_repository.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository movieRepository;

  MoviesBloc(this.movieRepository) : super(MoviesInitial()) {
    on<FetchMovieWithType>(_moviesFetched);
  }

  void _moviesFetched(FetchMovieWithType event, Emitter<MoviesState> emit) async {
    try {
      final movies = await movieRepository.fetchMovies(event.type);
      emit(MoviesFetched(movies, event.type));
      return;
    } on Exception catch (e) {
      emit(MovieFetchError(e.toString()));
    }
  }
}
