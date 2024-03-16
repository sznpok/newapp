part of 'user_register_bloc.dart';

@immutable
abstract class UserRegisterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterEvent extends UserRegisterEvent {
  final String email;
  final String password;

  RegisterEvent({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
