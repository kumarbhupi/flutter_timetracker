import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityDialogSelectorView extends StatelessWidget {
  bool checkboxval=true;
  @override
  Widget build(BuildContext context) {


    return FloatingActionButton(
      child : Icon(Icons.add),
    );
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [Checkbox(value: checkboxval, onChanged: (bool value) {
                    print(value);

                  },),
                    Text('Project'),

                  ],
                ),
                Row(
                  children: [Checkbox(value: checkboxval, onChanged: (bool value) {
                    print(value);
                  },),
                    Text('Task'),

                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Continue'),
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

