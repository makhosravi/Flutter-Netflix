class KeyWordsEntity {
  KeyWordsEntity({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  KeyWordsEntity copyWith({
    String? name,
    int? id,
  }) {
    return KeyWordsEntity(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}
