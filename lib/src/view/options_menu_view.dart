import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class OptionsMenuView extends StatelessWidget {
  int id;

  OptionsMenuView({this.id});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // both default to 16
      marginRight: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // this is ignored if animatedIcon is non null
      // child: Icon(Icons.add),
      visible: true,
      // If true user is forced to close dial manually
      // by tapping main button and overlay is not rendered.
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.deepOrange,
          onTap: () => showMyDialog(context, id),
          label: 'Create a new activity',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.deepOrangeAccent,
        ),
        SpeedDialChild(
          child: Icon(Icons.access_alarm, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: (){
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
          builder: (context) => InformationTimeDialog(),
          ));
        },
          label: 'Calculate total time',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.green,
        ),
      ],
    );
  }
}
