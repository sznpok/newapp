part of 'storage_bloc.dart';

@immutable
abstract class StorageEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DataStorageEvent extends StorageEvent {
  final NewsModel newsModel;

  DataStorageEvent(this.newsModel);

  @override
  // TODO: implement props
  List<Object?> get props => [newsModel];
}
