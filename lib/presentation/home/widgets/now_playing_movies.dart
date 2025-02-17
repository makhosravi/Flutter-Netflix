import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/common/widgets/movie/movie_card.dart';
import 'package:flutter_movie/presentation/home/bloc/now_playing_cubit.dart';
import 'package:flutter_movie/presentation/home/bloc/now_playing_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NowPlayingLoaded) {
            return SizedBox(
              height: 300.0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return MovieCard(movieEntity: state.movies[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10.0,
                ),
                itemCount: state.movies.length,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
              ),
            );
          }

          if (state is FailureLoadNowPlaying) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
