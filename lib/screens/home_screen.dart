import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/blog_widget.dart';
import '../widgets/category_widget.dart';
import '../providers/category_data.dart';
import '../providers/news.dart';
import '../models/article_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    getNews();
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
                      // Categories

                      height: 70,
                      child: Consumer(builder: (context, watch, child) {
                        final items = watch(categoryProvider);
                        return ListView.builder(
                          itemCount: items.category.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryWidget(
                              imageUrl:
                                  items.category[index].imageUrl.toString(),
                              categoryName:
                                  items.category[index].categoryName.toString(),
                            );
                          },
                        );
                      }),
                    ),

                    // Blogs
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
