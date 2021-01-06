import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timetracker_flutter/page_activities.dart';
//import 'package:timetracker_flutter/src/view/task_project_card_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageActivities(0),
    );
  }
}




