import 'package:timetracker_flutter/src/core/core.dart';

class Task extends Activity {
  Task.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    for (Map<String, dynamic> jsonChild in json['listIntervals']) {
      children.add(Interval.fromJson(jsonChild));
    }
  }
}
