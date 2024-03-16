import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/pages/auth_page/auth_repo/auth_repo.dart';

part 'user_register_event.dart';

part 'user_register_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegisterBloc() : super(UserRegisterInitial()) {
    on<RegisterEvent>(userRegisterEvent);
  }

  AuthRepo authRepo = AuthRepo();

  FutureOr<void> userRegisterEvent(
      RegisterEvent event, Emitter<UserRegisterState> emit) async {
    final response = await authRepo.registerUser(event.email, event.password);
    if (response != null) {
      emit(SuccessUserRegisterState());
    } else {
      emit(ErrorUserRegisterState());
    }
  }
}
