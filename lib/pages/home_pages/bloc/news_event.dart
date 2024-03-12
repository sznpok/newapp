part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchNewsEvent extends NewsEvent {
  final String categoryNews;

  FetchNewsEvent(this.categoryNews);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
