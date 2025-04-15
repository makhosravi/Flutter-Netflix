import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/movie/usecases/get_similar_movies_usecase.dart';
import 'package:flutter_movie/presentation/watch/bloc/similar_movies_state.dart';
import 'package:flutter_movie/service_locator.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesLoadind());
  void getSimilarMovies(int movieId) async {
    var returnedData =
        await sl<GetSimilarMoviesUsecase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(FailureSimilarMovies(errorMessage: error));
      },
      (data) {
        emit(SimilarMoviesLoaded(similarMovies: data));
      },
    );
  }
}
