import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/button_type.dart';

class PayerButtonView extends StatelessWidget {
  final ButtonType type;
  PayerButtonView({@required this.type});

  @override
  Widget build(BuildContext context) {
    switch(type){
      case ButtonType.project:{
        return RaisedButton(
          onPressed:(){},
          textColor: Colors.black,
          padding: const EdgeInsets.all(42.00),
          child: Text('View'),
        );

      }
      break;
      case  ButtonType.pausedTask: {
        return RaisedButton(
          onPressed:(){},
          textColor: Colors.black,
          padding: const EdgeInsets.all(29.00),
          child: Icon(Icons.play_arrow, size: 46),
        );
      }
      break;
      case ButtonType.playingTask : {
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
