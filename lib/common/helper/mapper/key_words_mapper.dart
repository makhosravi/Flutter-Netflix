import 'package:flutter_movie/core/entities/keywords_model.dart';
import 'package:flutter_movie/core/models/keywords_model.dart';

class KeyWordsMapper {
  static KeyWordsEntity toEntity(KeyWordsModel keyWordsModel) {
    return KeyWordsEntity(
      name: keyWordsModel.name,
      id: keyWordsModel.id,
    );
  }
}
