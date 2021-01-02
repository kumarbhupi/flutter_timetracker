import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create'),
            content:SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name: ",
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Insert Name Here',
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tags: ",
                    ),
                  ),

                  Row(
                    children: [
                      Flexible(child: TextField(

                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Insert Tags Here',
                        ),
                      ),),
                      IconButton(
                          icon: Icon(Icons.add_circle_outline), onPressed: null)
                    ],
                  ),
                  Row(
                    children: [

                    ],
                  )
                ],
              ),),
            actions: <Widget>[
              TextButton(
                child: Text('Create'),
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
      child: Text('Dialog'),
    );
  }
}