import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/pages/auth_page/auth_repo/auth_repo.dart';

part 'user_kyc_event.dart';

part 'user_kyc_state.dart';

class UserKycBloc extends Bloc<UserKycEvent, UserKycState> {
  UserKycBloc() : super(UserKycInitial()) {
    on<RegisterKycEvent>(registerKycEvent);
  }

  AuthRepo authRepo = AuthRepo();

  FutureOr<void> registerKycEvent(
      RegisterKycEvent event, Emitter<UserKycState> emit) async {
    final response = await authRepo.kycSetup(event.name, event.fatherName,
        event.motherName, event.age, event.citizenNumber);
    if (response == null) {
      log("Success Bloc");
      emit(SuccessUserKycState());
    } else {
      log("Error Bloc");
      emit(ErrorUserKycState());
    }
  }
}
