import 'package:flutter/material.dart';

class IntervalCardView extends StatelessWidget {
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
              //TODO: DO THE CHANGES TO POPULATE THIS DATA DYNAMICALLY
              Text('2020-10-4 09:47:03'),
              Text('2020-10-4 12:53:03'),
              Text('03:06:00')
            ],
          )
        ],
      ),
    );
  }
}
