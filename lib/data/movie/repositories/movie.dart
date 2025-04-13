import 'package:dartz/dartz.dart';
import 'package:flutter_movie/common/helper/mapper/movie_mapper.dart';
import 'package:flutter_movie/common/helper/mapper/trailer_mapper.dart';
import 'package:flutter_movie/core/models/trailer_model.dart';
import 'package:flutter_movie/data/movie/models/movie_model.dart';
import 'package:flutter_movie/data/movie/sources/movie.dart';
import 'package:flutter_movie/domain/movie/repositories/movie.dart';
import 'package:flutter_movie/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map(
            (item) => MovieMapper.toEntity(
              MovieModel.fromJson(item),
            ),
          )
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map(
            (item) => MovieMapper.toEntity(
              MovieModel.fromJson(item),
            ),
          )
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieService>().getMovieTrailer(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var trailer = TrailerMapper.toEntity(
          TrailerModel.fromJson(data['trailer']),
        );
        return Right(trailer);
      },
    );
  }
}
