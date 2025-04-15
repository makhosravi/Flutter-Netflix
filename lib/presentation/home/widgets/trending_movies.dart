import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/bloc/generic_data_cubit.dart';
import 'package:flutter_movie/common/bloc/generic_data_state.dart';
import 'package:flutter_movie/core/configs/assets/app_images.dart';
import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';
import 'package:flutter_movie/domain/movie/usecases/get_trending_movies.dart';
import 'package:flutter_movie/service_locator.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(
          sl<GetTrendingMoviesUsecase>(),
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoadind) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is DataLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.data
                  .map<String>(
                    (item) =>
                        AppImages.movieImageBasePath +
                        item.posterPath!.toString(),
                  )
                  .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400.0,
              showIndicator: true,
            );
          }

          if (state is FailureData) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
