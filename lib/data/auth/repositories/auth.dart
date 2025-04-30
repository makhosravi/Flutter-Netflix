// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/constants/param_keys.dart';
import 'package:flutter_movie/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/data/auth/sources/auth_service.dart';
//import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepositiry {
  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthService>().signup(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
          ParamKeys.accessTokenKey, data['user']['access_token']);
      sharedPreferences.setString(
          ParamKeys.refreshTokenKey, data['user']['refresh_token']);
      return Right(data);
    });

    //before shared preferences
    //return await sl<AuthApiService>().signup(params);

    //without dependency injection
    //return await authApiService.signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthService>().signin(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
          ParamKeys.accessTokenKey, data['user']['access_token']);
      sharedPreferences.setString(
          ParamKeys.refreshTokenKey, data['user']['refresh_token']);
      return Right(data);
    });
    //return await sl<AuthApiService>().signin(params);
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString(ParamKeys.accessTokenKey);
    return token != null ? true : false;
  }

  @override
  Future<Either> logout() async {
    var returnedData = await sl<AuthService>().logout();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final bool resStatus = data['success'];
        if (resStatus) {
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.clear();
        }
        return Right(resStatus);
      },
    );
  }

  @override
  Future<Either> refreshToken(String refreshToken) async {
    var returnedData = await sl<AuthService>().refreshToken(refreshToken);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final String accessToken = data['access_token'];

        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString(
          ParamKeys.accessTokenKey,
          accessToken,
        );

        return Right(data);
      },
    );
  }

  @override
  Future<Either> authCheck() async {
    var returnedData = await sl<AuthService>().authCheck();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        return Right(data);
      },
    );
  }

  // If not using dependency injection, this class must be used
  // in order to use the implementation
  // AuthApiService authApiService;
  // AuthRepositoryImpl({
  //   required this.authApiService,
  // });
}
