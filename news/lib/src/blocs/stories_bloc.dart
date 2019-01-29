import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repsitory.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _items = BehaviorSubject<int>();

  Observable<Map<int, Future<ItemModel>>> items;

  // StreamのGetter
  Observable<List<int>> get topIds => _topIds.stream;

  // SinksのGetter
  Function(int) get fetchItem => _items.sink.add;

  // Constructor
  StoriesBloc() {
    // transformerの実行を1回に制限する
    items = _items.stream.transform(_itemsTransformer());
  }

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, _) {
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel>> {

      },
    );
  }

  dispose() {
    _topIds.close();
    _items.close();
  }
}