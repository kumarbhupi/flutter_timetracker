import 'package:flutter/material.dart';

class taskProjectNameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0),
      child: Text(
        "Task/Project X",
        style: TextStyle(
            fontSize: 15.0
        ),
      ),
    );
  }
}