import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repsitory.dart';

class StoriesBloc {
  final _topIds = PublishSubject<List<int>>();

  //   Getter to Streams
  Observable<List<int>> get topIds => _topIds.stream;

  dispose() {
    _topIds.close();
  }
}