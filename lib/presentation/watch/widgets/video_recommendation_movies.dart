import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/widgets/movie/movie_card.dart';
import 'package:flutter_movie/presentation/watch/bloc/recommendation_movies_cubit.dart';
import 'package:flutter_movie/presentation/watch/bloc/recommendation_movies_state.dart';

class VideoRecommendationMovies extends StatelessWidget {
  final int movieId;
  const VideoRecommendationMovies({
    required this.movieId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendationMoviesCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationMoviesCubit, RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesLoadind) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecommendationMoviesLoaded) {
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
                        movieEntity: state.recommendations[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10.0,
                    ),
                    itemCount: state.recommendations.length,
                  ),
                ),
              ],
            );
          }
          if (state is FailureRecommendationMovies) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
