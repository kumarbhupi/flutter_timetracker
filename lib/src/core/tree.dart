import 'package:timetracker_flutter/src/core/core.dart';

class Tree {
  Activity root;

  Tree(Map<String, dynamic> dec) {
    // 1 level tree, root and children only, root is either Project or Task. If Project
    // children are Project or Task, that is, Activity. If root is Task, children are Instance.
    if (dec['class'] == "project") {
      root = Project.fromJson(dec);
    } else if (dec['class'] == "task") {
      root = Task.fromJson(dec);
    } else {
      assert(false);
    }
  }
}