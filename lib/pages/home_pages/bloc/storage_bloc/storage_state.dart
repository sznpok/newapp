part of 'storage_bloc.dart';

@immutable
abstract class StorageState {}

class StorageInitial extends StorageState {}

class StorageErrorState extends StorageState {
  final String message;

  StorageErrorState(this.message);
}

class StorageSuccessState extends StorageState {}

class StorageLoadingState extends StorageState {}
