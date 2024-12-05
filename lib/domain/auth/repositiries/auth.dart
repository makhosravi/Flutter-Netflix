import 'package:dartz/dartz.dart';

abstract class AuthRepositiry {

  Future<Either> signup();
}