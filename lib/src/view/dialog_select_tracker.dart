import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/view/page_create_activity.dart';
import 'package:timetracker_flutter/src/view/tag_card_view.dart';


enum SingingCharacter { Project, Task }

/// This is the stateful widget that the main application instantiates.
class ActivitySelectorRadioButton extends StatefulWidget {
  ActivitySelectorRadioButton({Key key}) : super(key: key);
  SingingCharacter character = SingingCharacter.Project;

  @override
  _ActivitySelectorRadioButtonState createState() =>
      _ActivitySelectorRadioButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ActivitySelectorRadioButtonState
    extends State<ActivitySelectorRadioButton> {
  SingingCharacter _character = SingingCharacter.Project;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Project'),
          leading: Radio(
            value: SingingCharacter.Project,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                widget.character = _character;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Task'),
          leading: Radio(
            value: SingingCharacter.Task,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                widget.character = _character;
              });
            },
          ),
        ),
      ],
    );
  }
}

class ActivitySelectorDialogView extends StatefulWidget {
  ActivitySelectorDialogView({this.id});
  int id;
  final selector = ActivitySelectorRadioButton();
  List<Widget> tags = List<Widget>();

  @override
  _ActivitySelectorDialogViewState createState() =>
      _ActivitySelectorDialogViewState();
}

class _ActivitySelectorDialogViewState
    extends State<ActivitySelectorDialogView> {
  var selector;
  TextEditingController _controllerName;
  TextEditingController _controllerTagName;
  List<Widget> _anotherList;


  @override
  void initState() {
    super.initState();
    selector = widget.selector;
    _anotherList = widget.tags;
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
    Future<void> _showMyDialogCreate(SingingCharacter name,
        List<Widget> anotherList) async {
      String name =
      selector.character == SingingCharacter.Project ? 'Project' : 'Task';

      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create $name'),
            content: SingleChildScrollView(
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
                            print('NEW --> $anotherList');
                            setState(() {
                              print(widget.tags);
                              widget.tags.add(
                                  createNewTag(_controllerTagName.value.text));
                            });
                          })
                    ],
                  ),
                  Row(
                    children: widget.tags,
                  ),
                ],
              ),
            ),
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
      //onPressed: showMyDialog,
      child: Icon(Icons.add),
    );
  }


}


Future<void> showMyDialog(BuildContext context, int id) async {
  final selector = ActivitySelectorRadioButton();
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Create'),
        content: SingleChildScrollView(
          child: selector,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Continue'),
            onPressed: () {
              String name =
              selector.character == SingingCharacter.Project
                  ? 'Project'
                  : 'Task';
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute<void>(
                builder: (context) => CreateActivityView(name: name, id: id,),
              ));

              //_showMyDialogCreate(selector.character, widget.tags);
            },
          ),
        ],
      );
    },
  );
}

/*class ActivitySelectDialogView extends StatelessWidget {
  final selector = ActivitySelectorRadioButton();

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialogCreate(SingingCharacter name) async {
      String name =
          selector.character == SingingCharacter.Project ? 'Project' : 'Task';
      TextEditingController _controller = TextEditingController();
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create $name'),
            content: SingleChildScrollView(
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
                        controller: _controller,
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
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Insert Tags Here',
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.add_circle_outline), onPressed: null)
                    ],
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
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

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Create'),
            content: SingleChildScrollView(
              child: selector,
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Continue'),
                onPressed: () {
                  _showMyDialogCreate(selector.character);
                },
              ),
            ],
          );
        },
      );
    }

    return FloatingActionButton(
      onPressed: _showMyDialog,
      child: Icon(Icons.add),
    );
  }
}*/
