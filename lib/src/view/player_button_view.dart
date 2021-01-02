import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/acitivity_type.dart';

class PlayerButtonView extends StatelessWidget {
  final ActivityType type;
  PlayerButtonView({@required this.type});

  @override
  Widget build(BuildContext context) {
    switch(type){
      case ActivityType.project:{
        return RaisedButton(
          onPressed:(){},
          textColor: Colors.black,
          padding: const EdgeInsets.all(42.00),
          child: Text('View'),
        );

      }
      break;
      case  ActivityType.pausedTask: {
        return RaisedButton(
          onPressed:(){},
          textColor: Colors.black,
          padding: const EdgeInsets.all(29.00),
          child: Icon(Icons.play_arrow, size: 46),
        );
      }
      break;
      case ActivityType.playingTask : {
        return RaisedButton(
          onPressed:(){},
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
