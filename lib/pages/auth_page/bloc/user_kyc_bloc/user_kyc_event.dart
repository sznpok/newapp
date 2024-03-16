part of 'user_kyc_bloc.dart';

@immutable
abstract class UserKycEvent extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisterKycEvent extends UserKycEvent {
  final String name;
  final String fatherName;
  final String motherName;
  final int age;
  final int citizenNumber;

  RegisterKycEvent(this.citizenNumber, this.age, this.motherName,
      this.fatherName, this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [name, fatherName, motherName, age, citizenNumber];
}
