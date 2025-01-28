import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/service_locator.dart';
//import 'package:flutter_movie/domain/auth/repositiries/auth.dart';

class SignupUsecase extends Usecase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepositiry>().signup(params!);
    //return await authRepositiry.signup(params!);
  }

  // Use this if not using dependency injection
  // final AuthRepositiry authRepositiry;

  // SignupUsecase({required this.authRepositiry});
}
