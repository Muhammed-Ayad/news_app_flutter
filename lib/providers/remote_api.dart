import 'package:dio/dio.dart';

import '../models/article_model.dart';

class RemoteApi {
  Dio dio = Dio();
  Future getData() async {
    final url =
        'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=9ef72132dd6a4c89857ac79ef28491d9';
    Response response = await dio.get(url);
    List<ArticleModel> articleModel = [];
    if (response.statusCode == 200) {
      for (var article in response.data) {
        articleModel.add(ArticleModel.fromJson(article));
      }
      return articleModel;
    }
  }
}
