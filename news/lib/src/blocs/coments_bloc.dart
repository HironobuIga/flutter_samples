import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repsitory.dart';

class CommentsBloc {
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();

  Observable<Map<int, Future<ItemModel>>> get itemWithComment =>
  _commentsOutput.stream;

  Function(int) get fetchItemWithcomments => _commentsFetcher.sink.add;

  dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}