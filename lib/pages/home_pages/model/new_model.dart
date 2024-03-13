import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'new_model.g.dart';

@HiveType(typeId: 0)
class NewsModel extends HiveObject {
  @HiveField(0)
  String? status;

  @HiveField(1)
  int? totalResults;

  @HiveField(2)
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: List<Articles>.from(
          (json['articles'] ?? []).map((x) => Articles.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class Articles extends HiveObject {
  @HiveField(0)
  Source? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  String? publishedAt;

  @HiveField(7)
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

@HiveType(typeId: 2)
class Source extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
