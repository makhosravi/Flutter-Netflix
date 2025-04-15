import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/widgets/movie/movie_card.dart';
import 'package:flutter_movie/presentation/watch/bloc/similar_movies_cubit.dart';
import 'package:flutter_movie/presentation/watch/bloc/similar_movies_state.dart';

class VideoSimilarMovies extends StatelessWidget {
  final int movieId;
  const VideoSimilarMovies({
    required this.movieId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit()..getSimilarMovies(movieId),
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesLoadind) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SimilarMoviesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar',
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
                        movieEntity: state.similarMovies[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10.0,
                    ),
                    itemCount: state.similarMovies.length,
                  ),
                ),
              ],
            );
          }
          if (state is FailureSimilarMovies) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
