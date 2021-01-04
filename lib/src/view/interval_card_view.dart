import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class IntervalCardView extends StatelessWidget {
  IntervalCardView({this.activity});

  final dynamic activity;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(183, 253, 204, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Interval X",
              style: TextStyle(
                  fontSize: 30.0
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Start'),
              Text('End'),
              Text('Duration')
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${(activity as Activity).initialString}'),
              Text('${(activity as Activity).finalString}'),
              Text('${(activity as Activity).duration}'),
            ],
          )
        ],
      ),
    );
  }
}
