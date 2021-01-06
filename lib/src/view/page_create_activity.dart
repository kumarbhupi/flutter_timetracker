import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetracker_flutter/src/services/server_call.dart';
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class CreateActivityView extends StatefulWidget {
  CreateActivityView({this.name, this.id});
  final int id;
  final String name;
  List<Widget> tags = List<Widget>();

  @override
  _CreateActivityViewState createState() => _CreateActivityViewState();
}

class _CreateActivityViewState extends State<CreateActivityView> {
  TextEditingController _controllerName;
  TextEditingController _controllerTagName;

  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerTagName = TextEditingController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _controllerName.dispose();
    _controllerTagName.dispose();
    super.dispose();
  }

  Widget createNewTag(String name) {
    return TagCardView(
      tagName: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create ${widget.name}'),
      ),
      body: SingleChildScrollView(
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
                  controller: _controllerName,
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
                Flexible(
                  child: TextField(
                    controller: _controllerTagName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Insert Tags Here',
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      setState(() {
                        print(widget.tags);
                        print(_controllerName.text);
                        widget.tags
                            .add(createNewTag(_controllerTagName.value.text));
                      });
                    })
              ],
            ),
            Row(
              children: widget.tags,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  create(widget.id, widget.name.toLowerCase(), _controllerName.value.text, []);
                  Navigator.of(context).pop();
                },
                child: const Text('Create', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
