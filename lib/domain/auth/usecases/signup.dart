import 'package:dartz/dartz.dart';
import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';

class SignupUsecase extends Usecase<Either, SignupReqParams>{

  final AuthRepositiry authRepositiry;

  SignupUsecase({required this.authRepositiry});

  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await authRepositiry.signup(params!);
  }
}