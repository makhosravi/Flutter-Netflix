import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/domain/auth/usecases/logout.dart';
import 'package:flutter_movie/presentation/auth/bloc/logout_state.dart';
import 'package:flutter_movie/service_locator.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  void logout() async {
    emit(LogoutLoading());
    var resStatus = await sl<LogoutUsecase>().call();
    resStatus.fold(
      (error) {
        emit(FailureLogout(errorMessage: error));
      },
      (data) {
        emit(LogoutLoaded(resStatus: data));
      },
    );
  }
}
