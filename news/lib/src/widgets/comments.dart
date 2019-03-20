import 'package:flutter/material.dart';
import 'dart:async';
import '../models/item_model.dart';

class Comments extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;

  Comments({this.itemId, this.itemMap});

  @override
  Widget build(BuildContext context) {
    
  }

}