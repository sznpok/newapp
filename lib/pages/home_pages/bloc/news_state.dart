part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class LoadingNewsInitial extends NewsState {}

class SuccessNewsState extends NewsState {
  final NewsModel newsModel;

  SuccessNewsState(this.newsModel);

  @override
  // TODO: implement props
  List<Object?> get props => [newsModel];
}

class ErrorNewsState extends NewsState {
  final String message;

  ErrorNewsState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
