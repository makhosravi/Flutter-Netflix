import 'package:flutter/material.dart';
import 'package:flutter_movie/common/widgets/appbar/app_bar.dart';
import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_overview.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_player.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_recommendation_movies.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_release_date.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_similar_movies.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_title.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  const MovieWatchPage({
    required this.movieEntity,
    super.key,
  });

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id),
            const SizedBox(height: 16.0),
            VideoTitle(title: movieEntity.title),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage),
              ],
            ),
            const SizedBox(height: 16.0),
            VideoOverview(overview: movieEntity.overview),
            const SizedBox(height: 16.0),
            VideoRecommendationMovies(movieId: movieEntity.id),
            const SizedBox(height: 16.0),
            VideoSimilarMovies(movieId: movieEntity.id),
          ],
        ),
      ),
    );
  }
}
