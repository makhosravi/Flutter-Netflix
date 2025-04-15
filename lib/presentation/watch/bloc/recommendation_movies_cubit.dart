import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/movie/usecases/get_recommendation_usecase.dart';
import 'package:flutter_movie/presentation/watch/bloc/recommendation_movies_state.dart';
import 'package:flutter_movie/service_locator.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoadind());
  void getRecommendationMovies(int movieId) async {
    var returnedData =
        await sl<GetRecommendationUsecase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(FailureRecommendationMovies(errorMessage: error));
      },
      (data) {
        emit(RecommendationMoviesLoaded(recommendations: data));
      },
    );
  }
}
