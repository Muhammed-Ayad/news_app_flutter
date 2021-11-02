import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    var url =
        'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=9ef72132dd6a4c89857ac79ef28491d9';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      (jsonData['articles'] as List).forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              author: element['author'] ?? '',
              title: element['title'] ?? '',
              description: element['description'] ?? '',
              url: element["url"] ?? '',
              urlToImage: element['urlToImage'] ?? '',
              content: element["content"] ?? '',
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}

class CatrgoryNews {
  List<ArticleModel> news = [];
  Future<void> getCategoryNews(String category) async {
    var url =
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=9ef72132dd6a4c89857ac79ef28491d9';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      (jsonData['articles'] as List).forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              author: element['author'] ?? '',
              title: element['title'] ?? '',
              description: element['description'] ?? '',
              url: element["url"] ?? '',
              urlToImage: element['urlToImage'] ?? '',
              content: element["content"] ?? '',
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}
