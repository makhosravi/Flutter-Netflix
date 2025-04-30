import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/auth/usecases/auth_check.dart';
import 'package:flutter_movie/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_movie/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_movie/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(Displaysplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUsecase>().call();
    if (isLoggedIn) {
      await sl<AuthCheckUseCase>().call();
      emit(Authenticated());
      return;
    }
    emit(Unauthenticated());
  }
}
