import 'package:flutter/material.dart';
import 'package:timetracker_flutter/page_activities.dart';

void main() =>
    runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'TimeTracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          subhead: TextStyle(fontSize: 20.0),
          body1: TextStyle(fontSize: 20.0),
        )
      ),
      home: PageActivities(0),

    );
  }


}
