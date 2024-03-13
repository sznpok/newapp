import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/constant/constant.dart';
import 'package:newsapp/utils/size.dart';

import '../model/new_model.dart';
import '../model/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen({super.key, this.articles});

  final Articles? articles;

  final dateFormat = DateFormat('MMM dd, yyyy');

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(articles!.publishedAt.toString());
    final data = dateFormat.format(dateTime);
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            SizeConfig.padding! * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articles!.title.toString(),
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$data by: ",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black.withOpacity(0.8),
                        ),
                  ),
                  Expanded(
                    child: Text(
                      articles!.author.toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              CachedNetworkImage(
                imageUrl: articles!.urlToImage.toString(),
                fit: BoxFit.cover,
                errorWidget: (context, string, _) {
                  return Icon(
                    Icons.error,
                    size: SizeConfig.screenWidth!,
                  );
                },
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.02),
              Text(
                articles!.description.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
