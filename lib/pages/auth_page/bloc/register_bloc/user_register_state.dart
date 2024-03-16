part of 'user_register_bloc.dart';

@immutable
abstract class UserRegisterState {}

class UserRegisterInitial extends UserRegisterState {}

class LoadingUserRegisterState extends UserRegisterState {
  final String message;

  LoadingUserRegisterState(this.message);
}

class SuccessUserRegisterState extends UserRegisterState {}

class ErrorUserRegisterState extends UserRegisterState {}
