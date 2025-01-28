import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/service_locator.dart';

class SigninUsecase extends Usecase<Either, SigninReqParams>{
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepositiry>().signin(params!);
  }
}