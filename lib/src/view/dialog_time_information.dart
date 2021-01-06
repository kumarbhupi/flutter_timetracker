import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationTimeDialog extends StatelessWidget {
  bool checkboxval = true;

  @override
  Widget build(BuildContext context) {
    //Future async
    return FloatingActionButton(
      //onPressed: _showMyDialog,
      child : Icon(Icons.access_alarm),
    );
  } //build
} //class

Future<void> showInformationTimeDialog(BuildContext context) async {
  bool checkboxval = true;

  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {

      return AlertDialog(
        title: Text('Introduce the following information'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Start Time: '),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'insert start time'),
                  )),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('End Time: '),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'insert end time'),
                  )),
              Row(
                children: [
                  Checkbox(
                    value: checkboxval,
                    onChanged: (bool value) {
                      print(value);
                    },
                  ),
                  Text('All'),
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'insert tracker name'),
                  )),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel '),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(' Accept'),
                  )
                ],
              )
            ], //children
          ),
        ),
      );
    }, //builder
  ); //showDialog
}
