import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/activity_type.dart';

class PlayerButtonView extends StatelessWidget {
  final ActivityType type;
  final VoidCallback onPressAction;
  PlayerButtonView({@required this.type, this.onPressAction});

  @override
  Widget build(BuildContext context) {
    switch(type){
      case ActivityType.project:{
        return Container(
          height: 100.0,
          margin: EdgeInsets.only(left: 30.0),
          child: RaisedButton(
            onPressed: onPressAction,
            textColor: Colors.black,
            color: Color.fromARGB(170,0,166,255),
            padding: const EdgeInsets.all(37.00),
            child: Text('View', style: new TextStyle(fontSize: 13.0),),
          ),
        );

      }
      break;
      case  ActivityType.pausedTask: {
        return RaisedButton(
          onPressed:onPressAction,
          textColor: Colors.black,
          color: Color.fromARGB(200,247,139,79),
          padding: const EdgeInsets.all(29.00),
          child: Icon(Icons.play_arrow, size: 46),
        );
      }
      break;
      case ActivityType.playingTask : {
        return RaisedButton(
          onPressed:onPressAction,
          textColor: Colors.black,
          color: Color.fromARGB(200,247,139,79),
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
