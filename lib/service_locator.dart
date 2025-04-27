import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/data/auth/repositories/auth.dart';
import 'package:flutter_movie/data/auth/sources/auth_service.dart';
import 'package:flutter_movie/data/movie/repositories/movie.dart';
import 'package:flutter_movie/data/movie/sources/movie.dart';
import 'package:flutter_movie/data/tv/repositories/tv_repository.dart';
import 'package:flutter_movie/data/tv/sources/tv_service.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_movie/domain/auth/usecases/logout.dart';
import 'package:flutter_movie/domain/auth/usecases/signin.dart';
import 'package:flutter_movie/domain/auth/usecases/signup.dart';
import 'package:flutter_movie/domain/movie/repositories/movie.dart';
import 'package:flutter_movie/domain/movie/usecases/get_movie_trailer.dart';
import 'package:flutter_movie/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:flutter_movie/domain/movie/usecases/get_recommendation_usecase.dart';
import 'package:flutter_movie/domain/movie/usecases/get_similar_movies_usecase.dart';
import 'package:flutter_movie/domain/movie/usecases/get_trending_movies.dart';
import 'package:flutter_movie/domain/movie/usecases/search_movie_usecase.dart';
import 'package:flutter_movie/domain/tv/repositories/tv_repository.dart';
import 'package:flutter_movie/domain/tv/usecases/get_keywords_usecase.dart';
import 'package:flutter_movie/domain/tv/usecases/get_popular_tv.dart';
import 'package:flutter_movie/domain/tv/usecases/get_recommendation_tv_usecase.dart';
import 'package:flutter_movie/domain/tv/usecases/get_similar_tv_usecase.dart';
import 'package:flutter_movie/domain/tv/usecases/search_tv_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieServiceImpl());
  sl.registerSingleton<TVService>(TVServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepositiry>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  // Usecase
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<LogoutUsecase>(LogoutUsecase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
  sl.registerSingleton<GetNowPlayingMovies>(GetNowPlayingMovies());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetMovieTrailerUsecase>(GetMovieTrailerUsecase());
  sl.registerSingleton<GetRecommendationUsecase>(GetRecommendationUsecase());
  sl.registerSingleton<GetSimilarMoviesUsecase>(GetSimilarMoviesUsecase());
  sl.registerSingleton<GetRecommendationTvUsecase>(
      GetRecommendationTvUsecase());
  sl.registerSingleton<GetSimilarTvUsecase>(GetSimilarTvUsecase());
  sl.registerSingleton<GetTVKeyWordsUsecase>(GetTVKeyWordsUsecase());
  sl.registerSingleton<SearchMovieUsecase>(SearchMovieUsecase());
  sl.registerSingleton<SearchTvUsecase>(SearchTvUsecase());
}
