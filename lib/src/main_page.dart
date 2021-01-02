import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/view/view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do'),
      ),
      body: ListActivitiesView(),
    );
  }
}
