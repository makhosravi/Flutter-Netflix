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

    factory MovieEntity.fromJson(Map<String, dynamic> json){ 
        return MovieEntity(
            backdropPath: json["backdrop_path"] ?? "",
            id: json["id"] ?? 0,
            title: json["title"] ?? "",
            originalTitle: json["original_title"] ?? "",
            overview: json["overview"] ?? "",
            posterPath: json["poster_path"] ?? "",
            mediaType: json["media_type"] ?? "",
            adult: json["adult"] ?? false,
            originalLanguage: json["original_language"] ?? "",
            genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
            popularity: json["popularity"] ?? 0.0,
            releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
            video: json["video"] ?? false,
            voteAverage: json["vote_average"] ?? 0.0,
            voteCount: json["vote_count"] ?? 0,
        );
    }

    @override
    String toString(){
        return "$backdropPath, $id, $title, $originalTitle, $overview, $posterPath, $mediaType, $adult, $originalLanguage, $genreIds, $popularity, $releaseDate, $video, $voteAverage, $voteCount, ";
    }

    @override
    List<Object?> get props => [
    backdropPath, id, title, originalTitle, overview, posterPath, mediaType, adult, originalLanguage, genreIds, popularity, releaseDate, video, voteAverage, voteCount, ];

}