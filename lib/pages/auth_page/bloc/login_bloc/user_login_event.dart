part of 'user_login_bloc.dart';

@immutable
abstract class UserLoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginEvent extends UserLoginEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
