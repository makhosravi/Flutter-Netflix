// use abstract in respect to dependency inversion
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie/core/constants/api_url.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
}

class MovieServiceImpl extends MovieService{
  @override
  Future<Either> getTrendingMovies() async {
    try{
      var response = await sl<DioClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }
}