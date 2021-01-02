import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/acitivity_type.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class ShowTimeView extends StatelessWidget {
  final ActivityType type;
  final dynamic activity;
  ShowTimeView({@required this.type, this.activity});
  @override
  Widget build(BuildContext context) {
    switch(type){
      case ActivityType.project : {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Start'),
            Text('${(activity as Activity).initialDate}'),
            SizedBox(height: 10.0),
            Text('Last modification'),
            Text('${(activity as Activity).finalDate}'),
            SizedBox(height: 10.0),
          ],
        );

      }
      break;
      case ActivityType.pausedTask : {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Start'),
            Text('${(activity as Activity).initialDate}'),
            SizedBox(height: 10.0),
            Text('Last modification'),
            Text('${(activity as Activity).finalDate}'),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text('Status'),
                Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        );

      }
      break;
      case ActivityType.playingTask : {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Start'),
            Text('${(activity as Activity).initialDate}'),
            SizedBox(height: 10.0),
            Text('Last modification'),
            Text('${(activity as Activity).finalDate}'),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text('Status'),
                Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        );
      }
      break;
      default : {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Start'),
            Text('2020-10-4 09:47:03'),
            SizedBox(height: 10.0),
            Text('Last modification'),
            Text('2020-10-4 12:53:03'),
            SizedBox(height: 10.0),
          ],
        );
      }
      break;
    }
  }
}
