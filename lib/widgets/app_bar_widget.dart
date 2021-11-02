import 'package:flutter/material.dart';

AppBar appBar = AppBar(
  backgroundColor: Colors.teal,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'News',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      Text('App')
    ],
  ),
  centerTitle: true,
  elevation: 0.0,
);
