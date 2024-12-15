import 'package:dartz/dartz.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';

abstract class AuthRepositiry {

  Future<Either> signup(SignupReqParams params);
}