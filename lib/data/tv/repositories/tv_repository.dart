import 'package:dartz/dartz.dart';
import 'package:flutter_movie/common/helper/mapper/tv_mapper.dart';
import 'package:flutter_movie/data/tv/models/tv_model.dart';
import 'package:flutter_movie/data/tv/sources/tv_service.dart';
import 'package:flutter_movie/domain/tv/repositories/tv_repository.dart';
import 'package:flutter_movie/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    var returndata = await sl<TVService>().getPopularTv();
    return returndata.fold((error) {
      return Left(error);
    }, (data) {
      var tv = List.from(data['content'])
          .map(
            (item) => TVMapper.toEntity(
              TVModel.fromJson(item),
            ),
          )
          .toList();
      return Right(tv);
    });
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var returnedData = await sl<TVService>().getRecommendationTVs(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvList = List.from(data['content'])
            .map(
              (item) => TVMapper.toEntity(
                TVModel.fromJson(item),
              ),
            )
            .toList();
        return Right(tvList);
      },
    );
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var returnedData = await sl<TVService>().getSimilarTVs(tvId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tvList = List.from(data['content'])
            .map(
              (item) => TVMapper.toEntity(
                TVModel.fromJson(item),
              ),
            )
            .toList();
        return Right(tvList);
      },
    );
  }
}
