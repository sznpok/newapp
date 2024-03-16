part of 'user_kyc_bloc.dart';

@immutable
abstract class UserKycState {}

class UserKycInitial extends UserKycState {}

class LoadingUserKycState extends UserKycState {}

class ErrorUserKycState extends UserKycState {}

class SuccessUserKycState extends UserKycState {}
