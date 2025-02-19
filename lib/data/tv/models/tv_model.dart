import 'package:equatable/equatable.dart';

class TVModel extends Equatable {
  const TVModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime? firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  TVModel copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? firstAirDate,
    String? name,
    double? voteAverage,
    int? voteCount,
  }) {
    return TVModel(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalName: originalName ?? this.originalName,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      name: name ?? this.name,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  factory TVModel.fromJson(Map<String, dynamic> json) {
    return TVModel(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? "",
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"] ?? 0,
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"] ?? "",
      originalName: json["original_name"] ?? "",
      overview: json["overview"] ?? "",
      popularity: json["popularity"] ?? 0.0,
      posterPath: json["poster_path"] ?? "",
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      name: json["name"] ?? "",
      voteAverage: double.parse(json["vote_average"].toString()),
      voteCount: json["vote_count"] ?? 0,
    );
  }

  @override
  String toString() {
    return "$adult, $backdropPath, $genreIds, $id, $originCountry, $originalLanguage, $originalName, $overview, $popularity, $posterPath, $firstAirDate, $name, $voteAverage, $voteCount, ";
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        name,
        voteAverage,
        voteCount,
      ];
}
