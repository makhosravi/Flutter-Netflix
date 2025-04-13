import 'package:equatable/equatable.dart';

class TrailerModel extends Equatable {
  const TrailerModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime? publishedAt;
  final String id;

  TrailerModel copyWith({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    DateTime? publishedAt,
    String? id,
  }) {
    return TrailerModel(
      iso6391: iso6391 ?? this.iso6391,
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      publishedAt: publishedAt ?? this.publishedAt,
      id: id ?? this.id,
    );
  }

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      iso6391: json["iso_639_1"] ?? "",
      iso31661: json["iso_3166_1"] ?? "",
      name: json["name"] ?? "",
      key: json["key"] ?? "",
      site: json["site"] ?? "",
      size: json["size"] ?? 0,
      type: json["type"] ?? "",
      official: json["official"] ?? false,
      publishedAt: DateTime.tryParse(json["published_at"] ?? ""),
      id: json["id"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt?.toIso8601String(),
        "id": id,
      };

  @override
  String toString() {
    return "$iso6391, $iso31661, $name, $key, $site, $size, $type, $official, $publishedAt, $id, ";
  }

  @override
  List<Object?> get props => [
        iso6391,
        iso31661,
        name,
        key,
        site,
        size,
        type,
        official,
        publishedAt,
        id,
      ];
}
