import 'package:flutter/material.dart';
import 'dart:async';
import '../models/item_model.dart';
import 'loading_container.dart';

class Comments extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comments({this.itemId, this.itemMap, this.depth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final item = snapshot.data;
        final children = <Widget>[
          ListTile(
            title: buildText(item),
            subtitle: item.by == "" ? Text('削除済み') : Text(item.by),
            contentPadding: EdgeInsets.only(
              right: 16.0,
              left: depth * 16.0,
            ),
          ),
          Divider(),
        ];
        item.kids.forEach((kidId) {
          children.add(
            Comments(itemId: kidId, itemMap: itemMap, depth: this.depth + 1)
          );
        });

        return Column(
          children: children,
        );
      },
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text
        .replaceAll('&#x27;', "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '');

    return Text(text);
  }
}