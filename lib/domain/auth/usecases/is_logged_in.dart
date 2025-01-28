import 'package:flutter_movie/core/usecase/usecase.dart';
import 'package:flutter_movie/domain/auth/repositiries/auth.dart';
import 'package:flutter_movie/service_locator.dart';

class IsLoggedInUsecase extends Usecase<bool, dynamic>{
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepositiry>().isLoggedIn();
  }
}