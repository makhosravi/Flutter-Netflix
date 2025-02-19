import 'package:flutter_movie/domain/tv/entities/tv_entity.dart';

abstract class PopularTVState {}

class PopularTVLoading extends PopularTVState {}

class PopularTVLoaded extends PopularTVState {
  final List<TVEntity> tv;
  PopularTVLoaded({required this.tv});
}

class FailurePopularTV extends PopularTVState {
  final String errorMessage;
  FailurePopularTV({required this.errorMessage});
}
