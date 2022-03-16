import 'package:intl/intl.dart';
import 'package:news_app/models/news_article_model.dart';

class NewsArticleViewModel {
  final NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle article}) : _newsArticle = article;

  String get title => _newsArticle.title!;

  String get description => _newsArticle.description!;

  String get urlToImage => _newsArticle.urlToImage!;

  String get url => _newsArticle.url!;

  String get author => _newsArticle.author!;

  String get content => _newsArticle.content!;

  String get publishedAt {
    final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
        .parse(_newsArticle.publishedAt!, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }
}
