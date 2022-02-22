part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieWithType extends MoviesEvent {
  final String type;

  const FetchMovieWithType(this.type);

  @override
  List<Object> get props => [type];
}
