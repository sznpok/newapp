import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/pages/home_pages/bloc/storage_bloc/storage_bloc.dart';
import 'package:newsapp/pages/home_pages/model/news_model.dart';
import 'package:newsapp/pages/home_pages/repo/news_repo.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>(newEvent);
  }

  NewsRepo newsRepo = NewsRepo();

  FutureOr<void> newEvent(FetchNewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadingNewsInitial());
    final data = await newsRepo.fetchNewsData(event.categoryNews);
    if (data.status == "ok") {
      emit(SuccessNewsState(data));
      //BlocProvider.of<StorageBloc>(context).add(DataStorageEvent(data));
      StorageBloc().add(DataStorageEvent(data));
    } else {
      emit(ErrorNewsState(data.runtimeType.toString()));
    }
  }
}
