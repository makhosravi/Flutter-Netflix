import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/core/entities/trailer_entity.dart';
import 'package:flutter_movie/domain/movie/usecases/get_movie_trailer.dart';
import 'package:flutter_movie/presentation/watch/bloc/trailer_state.dart';
import 'package:flutter_movie/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUsecase>().call(
      params: movieId,
    );
    returnedData.fold(
      (error) {
        emit(FailureLoadTrailer(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController youtubePlayerController =
            YoutubePlayerController(
                initialVideoId: trailerEntity.key,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                ));
        emit(
          TrailerLoaded(
            youtubePlayerController: youtubePlayerController,
          ),
        );
      },
    );
  }
}
