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



  @override
  void initState() {
    super.initState();
    selector = widget.selector;
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
    return FloatingActionButton(
      onPressed: (){},
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