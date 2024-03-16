import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/pages/auth_page/auth_repo/auth_repo.dart';

part 'user_login_event.dart';

part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super(UserLoginInitial()) {
    on<LoginEvent>(userLoginEvent);
  }

  AuthRepo authRepo = AuthRepo();

  FutureOr<void> userLoginEvent(
      LoginEvent event, Emitter<UserLoginState> emit) async {
    final response = await authRepo.loginUser(event.email, event.password);
    if (response != null) {
      emit(SuccessUserLoginState());
    } else {
      emit(ErrorUserLoginState(state.toString()));
    }
  }
}
