import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/button_type.dart';

class ShowTimeView extends StatelessWidget {
  final ButtonType type;
  ShowTimeView({@required this.type});
  @override
  Widget build(BuildContext context) {
    switch(type){
      case ButtonType.project : {
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
      case ButtonType.pausedTask : {
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
      case ButtonType.playingTask : {
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
