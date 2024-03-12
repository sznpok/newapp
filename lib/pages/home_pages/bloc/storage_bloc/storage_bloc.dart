import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../model/news_model.dart';

part 'storage_event.dart';

part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final Box _box = Hive.box("data");

  StorageBloc() : super(StorageInitial()) {
    on<StorageEvent>(storageEvent);
  }

  FutureOr<void> storageEvent(StorageEvent event, Emitter<StorageState> emit) {
    if (event is DataStorageEvent) {
      try {
        _box.put('data', event.newsModel);
        emit(StorageSuccessState());
      } catch (e) {
        emit(StorageErrorState(e.toString()));
      }
    }
  }
}
