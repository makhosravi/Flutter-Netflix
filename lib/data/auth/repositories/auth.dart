// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
//import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/service_locator.dart';

class AuthRepositoryImpl extends AuthRepositiry {

  // If not using dependency injection, this class must be used
  // in order to use the implementation
  // AuthApiService authApiService;
  // AuthRepositoryImpl({
  //   required this.authApiService,
  // });

  @override
  Future<Either> signup(SignupReqParams params) async {
    //return await authApiService.signup(params);
    return await sl<AuthApiService>().signup(params);
  } 

  @override
  Future<Either> signin(SigninReqParams params) async {
    return await sl<AuthApiService>().signin(params);
  }
  
}
