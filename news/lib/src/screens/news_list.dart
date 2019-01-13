import 'package:flutter/material.dart';
import 'dart:async';

class NewsList extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, int index) {
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Text('Im visible $index')
                : Text('You cant see me $index');
          },
        );
      },
    );
  }

  getFuture() {
    return Future.delayed(
      Duration(seconds: 2),
          () => 'hi',
    );
  }
}