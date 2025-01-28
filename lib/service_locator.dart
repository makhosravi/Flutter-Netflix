
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/data/auth/repositories/auth.dart';
import 'package:flutter_movie/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/domain/auth/usecases/signin.dart';
import 'package:flutter_movie/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepositiry>(AuthRepositoryImpl());

  // Usecase
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}