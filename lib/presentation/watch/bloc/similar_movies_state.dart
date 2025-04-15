import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';

// TODO: later, refactor the blocs showing list of movies, like this bloc and now_playing, creater one global bloc for
abstract class SimilarMoviesState {}

class SimilarMoviesLoadind extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity> similarMovies;
  SimilarMoviesLoaded({required this.similarMovies});
}

class FailureSimilarMovies extends SimilarMoviesState {
  final String errorMessage;
  FailureSimilarMovies({required this.errorMessage});
}
