import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/pages/home_pages/model/news_model.dart';
import 'package:newsapp/pages/home_pages/repo/news_repo.dart';

import '../../../../utils/database_helper.dart';
import '../../model/new_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>(newsEvent);
  }

  NewsRepo newsRepo = NewsRepo();

  FutureOr<void> newsEvent(
      FetchNewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadingNewsInitial());
    final data = await newsRepo.fetchNewsData(event.categoryNews);
    final box = await Hive.openBox<NewsModel>('news');
    const newsKey = "key-news";
    if (data.status == "ok") {
      await box.put(newsKey, data);
      final boxData = box.get(newsKey, defaultValue: null);
      log(boxData!.toJson().toString());
      emit(SuccessNewsState(boxData));
    } else {
      emit(ErrorNewsState(data.runtimeType.toString()));
    }
  }
}
