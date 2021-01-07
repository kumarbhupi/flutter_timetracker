import 'package:flutter/material.dart';

class TagCardView extends StatelessWidget {
  TagCardView({this.tagName});
  final String tagName;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 5.0),
        padding: EdgeInsets.all(1.0),
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
                color: Color.fromRGBO(183, 253, 204, 1),
                offset: new Offset(30.0,30.0),
                blurRadius: 25.0
            )
          ],

          borderRadius: new BorderRadius.circular(30.0),
          color: Color.fromRGBO(183, 253, 204, 1),
        ),
        child: new Text(
            "$tagName",
            style: TextStyle(
                fontSize: 15.0,
            )
        )
    );
  }
}