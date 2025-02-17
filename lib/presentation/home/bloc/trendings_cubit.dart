import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/movie/usecases/get_trending_movies.dart';
import 'package:flutter_movie/presentation/home/bloc/trendings_state.dart';
import 'package:flutter_movie/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUsecase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadTrendingMovies(errorMessage: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }
}
