part of 'user_login_bloc.dart';

@immutable
abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class LoadingUserLoginState extends UserLoginState {}

class ErrorUserLoginState extends UserLoginState {
  final String message;

  ErrorUserLoginState(this.message);
}

class SuccessUserLoginState extends UserLoginState {}
