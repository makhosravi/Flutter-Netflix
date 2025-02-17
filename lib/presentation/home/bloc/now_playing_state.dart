import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';

abstract class NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingLoaded({required this.movies});
}

class FailureLoadNowPlaying extends NowPlayingState {
  final String errorMessage;
  FailureLoadNowPlaying({required this.errorMessage});
}
