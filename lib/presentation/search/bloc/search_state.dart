// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';
import 'package:flutter_movie/domain/tv/entities/tv_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchMoviesLoaded extends SearchState {
  final List<MovieEntity> movies;
  SearchMoviesLoaded({
    required this.movies,
  });
}

class SearchTVsLoaded extends SearchState {
  final List<TVEntity> tvs;
  SearchTVsLoaded({
    required this.tvs,
  });
}

class FailureSearch extends SearchState {
  final String errorMessage;
  FailureSearch({
    required this.errorMessage,
  });
}
