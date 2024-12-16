// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';

class AuthRepositoryImpl extends AuthRepositiry {

  AuthApiService authApiService;
  AuthRepositoryImpl({
    required this.authApiService,
  });

  @override
  Future<Either> signup(SignupReqParams params) async {
    return await authApiService.signup(params);
  }
  
}
