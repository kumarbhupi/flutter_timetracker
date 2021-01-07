import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class ActivityNameView extends StatelessWidget {
  ActivityNameView({this.activity});

  final dynamic activity;

  @override
  Widget build(BuildContext context) {
    if (activity is Task) {
      return Container(

        child:
          Container(
            width: 140,
            margin: EdgeInsets.only(left: 5.0),
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              "${(activity as Task).name}",
              style: TextStyle(fontSize: 15.0),
            ),
          ),

      );
    }
    if (activity is Project) {
      return Container(
        child:
          Container(
            width: 140,
            margin: EdgeInsets.only(left: 5.0),
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              "${(activity as Project).name}",
              style: TextStyle(fontSize: 15.0),
            ),
          ),

      );
    }
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0),
      child: Text(
        "Task/Project X",
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }
}
