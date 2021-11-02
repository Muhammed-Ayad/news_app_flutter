import 'package:flutter/material.dart';

import '../screens/web_view_screen.dart';

class BlogWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;
  final String uri;
  BlogWidget(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.uri});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(
                blogUrl: uri,
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                desc,
                style:
                    TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
