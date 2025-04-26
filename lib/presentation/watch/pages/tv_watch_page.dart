import 'package:flutter/material.dart';
import 'package:flutter_movie/common/widgets/appbar/app_bar.dart';
import 'package:flutter_movie/domain/tv/entities/tv_entity.dart';
import 'package:flutter_movie/presentation/watch/widgets/tv_keywords.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_overview.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_player.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_recommendation_tvs.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_similar_tvs.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_title.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  const TvWatchPage({
    required this.tvEntity,
    super.key,
  });

  final TVEntity tvEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id),
            const SizedBox(height: 16.0),
            VideoTitle(title: tvEntity.name),
            const SizedBox(height: 16.0),
            TVKeyWords(tvId: tvEntity.id),
            const SizedBox(height: 16.0),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage),
            const SizedBox(height: 16.0),
            VideoOverview(overview: tvEntity.overview),
            const SizedBox(height: 16.0),
            VideoRecommendationTVs(tvId: tvEntity.id),
            const SizedBox(height: 16.0),
            VideoSimilarTVs(tvId: tvEntity.id),
          ],
        ),
      ),
    );
  }
}
