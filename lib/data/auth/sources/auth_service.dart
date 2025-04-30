import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie/core/constants/api_url.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<Either> logout();
  Future<Either> refreshToken(String refreshToken);
  Future<Either> authCheck();
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.singin,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> logout() async {
    try {
      var response = await sl<DioClient>().post(ApiUrl.logout);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> refreshToken(String refreshToken) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.refreshToken,
        data: {
          'refreshToken': refreshToken,
        },
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> authCheck() async {
    try {
      var response = await sl<DioClient>().get(ApiUrl.authCheck);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

class AuthFirebaseApiService extends AuthService {
  @override
  Future<Either> signup(SignupReqParams params) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either> refreshToken(String refreshToken) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<Either> authCheck() {
    // TODO: implement authCheck
    throw UnimplementedError();
  }
}
