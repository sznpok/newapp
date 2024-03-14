import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart';
import '../../../utils/request_type_exception.dart';
import '../model/new_model.dart';

class NewsRepo {
  Client client = Client();

  Future<NewsModel> fetchNewsData(String category) async {
    String newsApi =
        'https://newsapi.org/v2/everything?q=$category&apiKey=8a5ec37e26f845dcb4c2b78463734448';
    final response = await client.get(Uri.parse(newsApi));
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newModel = NewsModel.fromJson(data);
        return newModel;
      } else {
        throw Exception("Error fetching news");
      }
    } catch (e) {
      throw RequestTypeNotFoundException(e.toString());
    }
  }
}
