import 'dart:async';

import 'package:dio/dio.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/utils/constants.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsArticle>> fetchHeadlinesByCountry(String country) async {
    final response = await dio.get(Constants.headlinesFor(country));

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to get top news');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url = Constants.TOP_HEADLINES_URL;

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failled to get top news");
    }
  }
}
