import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalTimeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return FloatingActionButton(
      //onPressed: _showMyDialog,
      child : Icon(Icons.access_alarm),
    );
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Total Time'),
          content: Text('_______________'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}