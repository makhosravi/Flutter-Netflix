import 'package:dartz/dartz.dart';
import 'package:flutter_movie/common/helper/mapper/movie_mapper.dart';
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
}
