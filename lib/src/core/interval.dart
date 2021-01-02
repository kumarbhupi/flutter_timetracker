import 'package:timetracker_flutter/src/core/core.dart';

class Interval {
  int id;
  DateTime initialDate;
  DateTime finalDate;
  int duration;
  bool active;

  Interval.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        initialDate = json['startTime']=='null' ? null : dateFormatter.parse(json['startTime']),
        finalDate = json['endTime']=='null' ? null : dateFormatter.parse(json['endTime']),
        duration = json['duration'],
        active = json['active'];
}
