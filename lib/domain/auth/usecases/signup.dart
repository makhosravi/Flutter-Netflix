import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie/service_locator.dart';
//import 'package:flutter_movie/domain/auth/repositiries/auth.dart';

class SignupUsecase extends Usecase<Either, SignupReqParams>{

  // Use this if not using dependency injection
  // final AuthRepositiry authRepositiry;

  // SignupUsecase({required this.authRepositiry});

  @override
  Future<Either> call({SignupReqParams? params}) async {
    //return await authRepositiry.signup(params!);
    return await sl<AuthApiService>().signup(params!);
  }
}