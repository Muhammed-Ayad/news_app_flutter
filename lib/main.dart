import 'package:flutter/material.dart';
import './screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',  
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:HomePage(),
    );
  }
}
