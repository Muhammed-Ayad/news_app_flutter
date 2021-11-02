import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
import '../providers/news.dart';
import '../models/article_model.dart';
import '../widgets/blog_widget.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String category;
  CategoryNewsScreen({required this.category});

  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CatrgoryNews newsClass = CatrgoryNews();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogWidget(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].description,
                            uri: articles[index].url,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
