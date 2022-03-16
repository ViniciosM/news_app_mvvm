import 'package:flutter/material.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/service/web_service.dart';
import 'package:news_app/viewmodels/news_article_viewmodel.dart';


enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {

  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = [];

  void topHeadlinesByCountry(String country) async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> newsArticle = await WebService().fetchHeadlinesByCountry(country);

    articles = newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();

    if(articles.isEmpty){
      loadingStatus = LoadingStatus.empty;
    }else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();

  }

   void topHeadlines() async {

    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    notifyListeners();

    articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}

  

  

  








