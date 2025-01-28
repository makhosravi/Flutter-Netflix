import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie/service_locator.dart';

class SigninUsecase extends Usecase<Either, SigninReqParams>{
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthApiService>().signin(params!);
  }
}