import 'package:timetracker_flutter/src/core/core.dart';


class Project extends Activity {
  Project.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json.containsKey('trackers')) {
      // json has only 1 level because depth=1 or 0 in time_tracker
      for (Map<String, dynamic> jsonChild in json['trackers']) {
        if (jsonChild['class'] == "project") {
          children.add(Project.fromJson(jsonChild));
          // condition on key avoids infinite recursion
        } else if (jsonChild['class'] == "task") {
          children.add(Task.fromJson(jsonChild));
        } else {
          assert(false);
        }
      }
    }
  }
}
