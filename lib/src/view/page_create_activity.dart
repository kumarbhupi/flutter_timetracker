import 'package:flutter/material.dart';

class CreateActivityView extends StatefulWidget {
  CreateActivityView({this.name});
  final String name;
  @override
  _CreateActivityViewState createState() => _CreateActivityViewState();
}

class _CreateActivityViewState extends State<CreateActivityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create ${widget.name}'),
      ),
    );
  }
}
