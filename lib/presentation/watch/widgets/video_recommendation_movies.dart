import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/bloc/generic_data_cubit.dart';
import 'package:flutter_movie/common/bloc/generic_data_state.dart';
import 'package:flutter_movie/common/widgets/movie/movie_card.dart';
import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';
import 'package:flutter_movie/domain/movie/usecases/get_recommendation_usecase.dart';
import 'package:flutter_movie/service_locator.dart';

class VideoRecommendationMovies extends StatelessWidget {
  final int movieId;
  const VideoRecommendationMovies({
    required this.movieId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(
          sl<GetRecommendationUsecase>(),
          params: movieId,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoadind) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommendations',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 300.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10.0,
                    ),
                    itemCount: state.data.length,
                  ),
                ),
              ],
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
