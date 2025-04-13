import 'package:flutter/material.dart';
import 'package:flutter_movie/common/helper/navigation/app_navigation.dart';
import 'package:flutter_movie/core/configs/assets/app_images.dart';
import 'package:flutter_movie/core/configs/theme/app_colors.dart';
import 'package:flutter_movie/domain/movie/enteties/movie_entity.dart';
import 'package:flutter_movie/presentation/watch/pages/watch.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movieEntity,
  });

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          MovieWatchPage(
            movieEntity: movieEntity,
          ),
        );
      },
      child: Container(
        width: 180.0,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      AppImages.movieImageBasePath + movieEntity.posterPath,
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieEntity.title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Colors.amber,
                      ),
                      Text(
                        ' ${movieEntity.voteAverage.toDouble().toStringAsFixed(1)}',
                        style: const TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
