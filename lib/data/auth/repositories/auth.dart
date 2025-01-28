// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_movie/data/auth/models/signin_req_params.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
//import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepositiry {
  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthApiService>().signup(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });

    //before shared preferences
    //return await sl<AuthApiService>().signup(params);

    //without dependency injection
    //return await authApiService.signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthApiService>().signin(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
    //return await sl<AuthApiService>().signin(params);
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    return token != null ? true : false;
  }

  // If not using dependency injection, this class must be used
  // in order to use the implementation
  // AuthApiService authApiService;
  // AuthRepositoryImpl({
  //   required this.authApiService,
  // });
}
