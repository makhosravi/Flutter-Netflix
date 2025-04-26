import 'package:equatable/equatable.dart';

class KeyWordsModel extends Equatable {
  const KeyWordsModel({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  KeyWordsModel copyWith({
    String? name,
    int? id,
  }) {
    return KeyWordsModel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  factory KeyWordsModel.fromJson(Map<String, dynamic> json) {
    return KeyWordsModel(
      name: json["name"] ?? "",
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };

  @override
  String toString() {
    return "$name, $id, ";
  }

  @override
  List<Object?> get props => [
        name,
        id,
      ];
}
