import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalTimeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Total Time'),
            content: Text('__________________'),
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

    return FloatingActionButton(
      onPressed: _showMyDialog,
      child : Icon(Icons.access_alarm),
    );
  }
}