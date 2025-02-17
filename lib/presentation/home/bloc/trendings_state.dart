// ignore_for_file: public_member_api_docs, sort_constructors_first
//using abstract class because all the state must have same type
import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({
    required this.movies,
  });
}

class FailureLoadTrendingMovies extends TrendingState {
  final String errorMessage;
  FailureLoadTrendingMovies({
    required this.errorMessage,
  });
}
