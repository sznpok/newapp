import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constant/constant.dart';
import 'package:newsapp/pages/home_pages/bloc/news_bloc/news_bloc.dart';
import 'package:newsapp/utils/size.dart';
import 'package:intl/intl.dart';

import 'news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key, this.categories});

  final String? categories;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    context.read<NewsBloc>().add(FetchNewsEvent(widget.categories!));
    super.initState();
  }

  final dateFormat = DateFormat('MMM dd, yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categories!,
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is LoadingNewsInitial) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ErrorNewsState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is SuccessNewsState) {
            return ListView.builder(
                itemCount: state.newsModel.articles!.length,
                padding: EdgeInsets.all(SizeConfig.padding! * 0.02),
                shrinkWrap: false,
                itemBuilder: (context, i) {
                  final news = state.newsModel.articles![i];
                  DateTime dateTime = DateTime.parse(
                      state.newsModel.articles![i].publishedAt.toString());
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                            articles: state.newsModel.articles![i],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: news.urlToImage.toString(),
                            height: SizeConfig.screenHeight! * 0.1,
                            width: SizeConfig.screenWidth! * 0.3,
                            fit: BoxFit.cover,
                            errorWidget: (context, string, _) {
                              return Icon(Icons.error);
                            },
                            placeholder: (context, string) {
                              return Icon(Icons.image);
                            },
                            // width: SizeConfig.screenWidth! * 0.2,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.02,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news.title!,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight! * 0.01,
                                ),
                                Text(
                                  dateFormat.format(dateTime),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
