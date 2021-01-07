import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showDurationDialog(BuildContext context, Future<int> duration) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return FutureBuilder<int>(
        future: duration,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return AlertDialog(
              title: Text('Total Time'),
              content: Text('${snapshot.data} seconds'),
              actions: <Widget>[
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
          else if (snapshot.hasError){
            return Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Center(
                  child: Text('${snapshot.error}'),
                ));

          }
          return Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        },
      );
    },
  );
}


class TotalTimeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return FloatingActionButton(
      //onPressed: _showMyDialog,
      child : Icon(Icons.access_alarm),
    );
  }

}