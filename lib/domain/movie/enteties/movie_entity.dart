import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime? releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieEntity copyWith({
    String? backdropPath,
    int? id,
    String? title,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? mediaType,
    bool? adult,
    String? originalLanguage,
    List<int>? genreIds,
    double? popularity,
    DateTime? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieEntity(
      backdropPath: backdropPath ?? this.backdropPath,
      id: id ?? this.id,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      mediaType: mediaType ?? this.mediaType,
      adult: adult ?? this.adult,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      genreIds: genreIds ?? this.genreIds,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  String toString() {
    return "$backdropPath, $id, $title, $originalTitle, $overview, $posterPath, $mediaType, $adult, $originalLanguage, $genreIds, $popularity, $releaseDate, $video, $voteAverage, $voteCount, ";
  }

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        title,
        originalTitle,
        overview,
        posterPath,
        mediaType,
        adult,
        originalLanguage,
        genreIds,
        popularity,
        releaseDate,
        video,
        voteAverage,
        voteCount,
      ];
}
