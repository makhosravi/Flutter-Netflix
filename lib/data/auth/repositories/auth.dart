import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie/core/constants/api_url.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/service_locator.dart';

class AuthRepositoryImpl extends AuthRepositiry{
  @override
  Future<Either> signup(SignupReqParams params) {
    // TODO: implement signup
    throw UnimplementedError();
  }
  
}