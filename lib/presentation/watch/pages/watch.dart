import 'package:flutter/material.dart';
import 'package:flutter_movie/common/widgets/appbar/app_bar.dart';
import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';
import 'package:flutter_movie/presentation/watch/widgets/video_player.dart';

class MovieWatchPage extends StatelessWidget {
  const MovieWatchPage({
    required this.movieEntity,
    super.key,
  });

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: VideoPlayer(
          id: movieEntity.id,
        ),
      ),
    );
  }
}
