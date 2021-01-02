import 'package:flutter/material.dart';

class tagCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
                color: Color.fromRGBO(183, 253, 204, 1),
                offset: new Offset(30.0,30.0),
                blurRadius: 30.0
            )
          ],
          borderRadius: new BorderRadius.circular(30.0),
          color: Color.fromRGBO(183, 253, 204, 1),
        ),
        child: new Text(
            "Tag X",
            style: TextStyle(
                fontSize: 10.0
            )
        )
    );
  }
}