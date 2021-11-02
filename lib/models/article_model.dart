import 'dart:convert';

class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'content': content,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) => ArticleModel.fromMap(json.decode(source));
} 
