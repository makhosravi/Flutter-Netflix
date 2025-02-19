import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/tv/usecases/get_popular_tv.dart';
import 'package:flutter_movie/presentation/home/bloc/popular_tv_state.dart';
import 'package:flutter_movie/service_locator.dart';

class PopularTVCubit extends Cubit<PopularTVState> {
  PopularTVCubit() : super(PopularTVLoading());

  void getPopularTV() async {
    var returndData = await sl<GetPopularTVUseCase>().call();
    returndData.fold(
      (error) {
        emit(FailurePopularTV(errorMessage: error));
      },
      (data) {
        emit(PopularTVLoaded(tv: data));
      },
    );
  }
}
