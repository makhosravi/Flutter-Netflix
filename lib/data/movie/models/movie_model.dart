// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_movie/core/configs/assets/app_images.dart';

class MovieModel extends Equatable {
  const MovieModel({
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

  MovieModel copyWith({
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
    return MovieModel(
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

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json["backdrop_path"] ?? "",
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      originalTitle: json["original_title"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      mediaType: json["media_type"] ?? "",
      adult: json["adult"] ?? false,
      originalLanguage: json["original_language"] ?? "",
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      popularity: json["popularity"] ?? 0.0,
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      video: json["video"] ?? false,
      voteAverage: json["vote_average"] ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
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

/*
[
	{
		"backdrop_path": "/ntQ1Y9fr7IFT1XN9NfdIFomSKHg.jpg",
		"id": 950396,
		"title": "The Gorge",
		"original_title": "The Gorge",
		"overview": "Two highly trained operatives grow close from a distance after being sent to guard opposite sides of a mysterious gorge. When an evil below emerges, they must work together to survive what lies within.",
		"poster_path": "/7iMBZzVZtG0oBug4TfqDb9ZxAOa.jpg",
		"media_type": "movie",
		"adult": false,
		"original_language": "en",
		"genre_ids": [
			53,
			28,
			10749,
			27,
			878
		],
		"popularity": 168.935,
		"release_date": "2025-02-13",
		"video": false,
		"vote_average": 7.2,
		"vote_count": 25
	},
	{
		"backdrop_path": "/uJK0jjJ8QDOQw5lcNBwu059ht4D.jpg",
		"id": 1294203,
		"title": "My Fault: London",
		"original_title": "My Fault: London",
		"overview": "When Noah's mother, Ella, falls in love with the very wealthy William, the two move from America to London to live with William and his son Nick. Upon arrival, the 18-year-old Noah meets bad boy Nick, and there is an immediate attraction between the two.",
		"poster_path": "/bioObjvmJdDRxnWM3TrQYaMUbAQ.jpg",
		"media_type": "movie",
		"adult": false,
		"original_language": "en",
		"genre_ids": [
			10749,
			18
		],
		"popularity": 254.734,
		"release_date": "2025-02-12",
		"video": false,
		"vote_average": 7.1,
		"vote_count": 35
	},
	{
		"backdrop_path": "/s1ge9SG2zfJdMeZ69VMEbxeKuAE.jpg",
		"id": 1252377,
		"title": "La Dolce Villa",
		"original_title": "La Dolce Villa",
		"overview": "When his daughter decides to buy a crumbling Tuscan villa, Eric rushes to Italy to talk her out of it — and instead finds beauty, romance and new purpose.",
		"poster_path": "/sEma5RN8aZ5Yu2Dkefyn5ULdlc1.jpg",
		"media_type": "movie",
		"adult": false,
		"original_language": "en",
		"genre_ids": [
			10749,
			35
		],
		"popularity": 50.106,
		"release_date": "2025-02-12",
		"video": false,
		"vote_average": 6.1,
		"vote_count": 12
	},
	{
		"backdrop_path": "/rOMLLMGgDgGG6XeT3P8sUdUb8nl.jpg",
		"id": 1126166,
		"title": "Flight Risk",
		"original_title": "Flight Risk",
		"overview": "A U.S. Marshal escorts a government witness to trial after he's accused of getting involved with a mob boss, only to discover that the pilot who is transporting them is also a hitman sent to assassinate the informant. After they subdue him, they're forced to fly together after discovering that there are others attempting to eliminate them.",
		"poster_path": "/4cR3hImKd78dSs652PAkSAyJ5Cx.jpg",
		"media_type": "movie",
		"adult": false,
		"original_language": "en",
		"genre_ids": [
			28,
			53,
			80
		],
		"popularity": 149.815,
		"release_date": "2025-01-22",
		"video": false,
		"vote_average": 6.1,
		"vote_count": 78
	},
	{
		"backdrop_path": "/8eifdha9GQeZAkexgtD45546XKx.jpg",
		"id": 822119,
		"title": "Captain America: Brave New World",
		"original_title": "Captain America: Brave New World",
		"overview": "After meeting with newly elected U.S. President Thaddeus Ross, Sam finds himself in the middle of an international incident. He must discover the reason behind a nefarious global plot before the true mastermind has the entire world seeing red.",
		"poster_path": "/pzIddUEMWhWzfvLI3TwxUG2wGoi.jpg",
		"media_type": "movie",
		"adult": false,
		"original_language": "en",
		"genre_ids": [
			53,
			28,
			878
		],
		"popularity": 1497.343,
		"release_date": "2025-02-12",
		"video": false,
		"vote_average": 6.3,
		"vote_count": 139
	}
]*/
