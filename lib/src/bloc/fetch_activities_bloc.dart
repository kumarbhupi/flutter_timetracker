import 'dart:async';

import 'package:timetracker_flutter/src/services/services.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class FetchActivitiesBloc{
  final _streamController = StreamController<Tree>();
  Tree _tree;
  StreamSink<Tree> get treeSink => _streamController.sink;
  Stream<Tree> get treeStream => _streamController.stream;

  Future<Tree> fetchData([int id = 0]) async{
    _tree = await getTree(id);
    treeSink.add(_tree);
    return _tree;
  }

  void dispose(){
    _streamController.close();
  }
}