import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/movie/usecases/search_movie_usecase.dart';
import 'package:flutter_movie/domain/tv/usecases/search_tv_usecase.dart';
import 'package:flutter_movie/presentation/search/bloc/search_state.dart';
import 'package:flutter_movie/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:flutter_movie/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());

      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;

        case SearchType.tv:
          searchTV(query);
          break;
      }
    }
  }

  void searchMovie(String query) async {
    var returnedData = await sl<SearchMovieUsecase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(FailureSearch(errorMessage: error));
      },
      (data) {
        emit(SearchMoviesLoaded(movies: data));
      },
    );
  }

  void searchTV(String query) async {
    var returnedData = await sl<SearchTvUsecase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(FailureSearch(errorMessage: error));
      },
      (data) {
        emit(SearchTVsLoaded(tvs: data));
      },
    );
  }
}
