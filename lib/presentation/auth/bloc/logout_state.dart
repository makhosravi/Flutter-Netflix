// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutLoaded extends LogoutState {
  final bool resStatus;
  LogoutLoaded({
    required this.resStatus,
  });
}

class FailureLogout extends LogoutState {
  final String errorMessage;
  FailureLogout({
    required this.errorMessage,
  });
}
