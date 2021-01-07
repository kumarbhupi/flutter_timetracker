import 'package:intl/intl.dart';

final DateFormat dateFormatter = DateFormat("yyyy-MM-dd HH:mm:ss");

abstract class Activity {
  int id;
  String name;
  DateTime initialDate;
  DateTime finalDate;
  int duration;
  String initialString;
  String finalString;
  bool active;
  List<dynamic> tags;
  List<dynamic> children = List<dynamic>();

  Activity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        initialDate = json['startTime']=='null' ? null : dateFormatter.parse(json['startTime']),
        finalDate = json['endTime']=='null' ? null : dateFormatter.parse(json['endTime']),
        initialString = json['startTime']=='null' ? '-' : json['startTime'],
        finalString = json['endTime']=='null' ? '-' : json['endTime'],
        duration = json['duration'],
        active = json['active'],
        tags = json['tags'];
}