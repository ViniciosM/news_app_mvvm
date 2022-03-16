import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_list_view_model.dart';
import 'package:news_app/views/news_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/change_notifier_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigoAccent,
        appBarTheme: const AppBarTheme(
          color: Color(0xffFEFDFD),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NewsArticleListViewModel(),
          )
        ],
        child: NewsView(),
      ),
    );
  }
}
