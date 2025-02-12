// use abstract in respect to dependency inversion
import 'package:dartz/dartz.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
}

class MovieServiceImpl extends MovieService{
  @override
  Future<Either> getTrendingMovies() {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }
}