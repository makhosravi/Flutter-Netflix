import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';

// TODO: later, refactor the blocs showing list of movies, like this bloc and now_playing, creater one global bloc for
abstract class RecommendationMoviesState {}

class RecommendationMoviesLoadind extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> recommendations;
  RecommendationMoviesLoaded({required this.recommendations});
}

class FailureRecommendationMovies extends RecommendationMoviesState {
  final String errorMessage;
  FailureRecommendationMovies({required this.errorMessage});
}
