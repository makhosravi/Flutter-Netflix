import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/data/auth/repositories/auth.dart';
import 'package:flutter_movie/data/auth/sources/auth_service.dart';
import 'package:flutter_movie/data/movie/repositories/movie.dart';
import 'package:flutter_movie/data/movie/sources/movie.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_movie/domain/auth/usecases/signin.dart';
import 'package:flutter_movie/domain/auth/usecases/signup.dart';
import 'package:flutter_movie/domain/movie/repositories/movie.dart';
import 'package:flutter_movie/domain/movie/usecases/get_trending_movies.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepositiry>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // Usecase
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
}
