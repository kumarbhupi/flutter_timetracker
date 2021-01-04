import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/acitivity_type.dart';

class PlayerButtonView extends StatelessWidget {
  final ActivityType type;
  final VoidCallback onPressAction;
  PlayerButtonView({@required this.type, this.onPressAction});

  @override
  Widget build(BuildContext context) {
    switch(type){
      case ActivityType.project:{
        return RaisedButton(
          onPressed: onPressAction,
          textColor: Colors.black,
          padding: const EdgeInsets.all(37.00),
          child: Text('View',),
        );

      }
      break;
      case  ActivityType.pausedTask: {
        return RaisedButton(
          onPressed:onPressAction,
          textColor: Colors.black,
          padding: const EdgeInsets.all(29.00),
          child: Icon(Icons.play_arrow, size: 46),
        );
      }
      break;
      case ActivityType.playingTask : {
        return RaisedButton(
          onPressed:onPressAction,
          textColor: Colors.black,
          padding: const EdgeInsets.all(29.00),
          child: Icon(Icons.pause, size: 46),
        );
      }
      break;
      default : {
        return null;
      }
      break;
    }
  }
}
