import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:flutter_movie/presentation/home/bloc/now_playing_state.dart';
import 'package:flutter_movie/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMovies>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadNowPlaying(errorMessage: error));
      },
      (data) {
        emit(NowPlayingLoaded(movies: data));
      },
    );
  }
}
