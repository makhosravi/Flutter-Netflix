import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/domain/movie/repositories/movie.dart';
import 'package:flutter_movie/service_locator.dart';

class GetMovieTrailerUsecase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getMovieTrailer(params!);
  }
}
