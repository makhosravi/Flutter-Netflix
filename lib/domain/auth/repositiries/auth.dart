import 'package:dartz/dartz.dart';
import 'package:flutter_movie/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';

abstract class AuthRepositiry {
  Future<Either> signup(SignupReqParams params);

  Future<Either> signin(SigninReqParams params);

  Future<bool> isLoggedIn();

  Future<Either> logout();
}
