import 'package:timetracker_flutter/src/core/core.dart';

class Task extends Activity {
  bool active;
  Task.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    active = json['active'];
    for (Map<String, dynamic> jsonChild in json['listIntervals']) {
      children.add(Interval.fromJson(jsonChild));
    }
  }
}
