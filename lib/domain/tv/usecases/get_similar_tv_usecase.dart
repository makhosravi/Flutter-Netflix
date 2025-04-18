import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/domain/tv/repositories/tv_repository.dart';
import 'package:flutter_movie/service_locator.dart';

class GetSimilarTvUsecase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TVRepository>().getSimilarTVs(params!);
  }
}
