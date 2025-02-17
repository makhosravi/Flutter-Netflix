import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/domain/movie/repositories/movie.dart';
import 'package:flutter_movie/service_locator.dart';

class GetNowPlayingMovies extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }
}
