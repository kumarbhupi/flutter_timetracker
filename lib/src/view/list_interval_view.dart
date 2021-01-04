import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:timetracker_flutter/src/core/core.dart';
import 'package:timetracker_flutter/src/core/interval.dart' as MyInterval;

class ListIntervalView extends StatefulWidget {
  final int id;
  ListIntervalView(this.id);

  @override
  _ListIntervalViewState createState() => _ListIntervalViewState();
}

class _ListIntervalViewState extends State<ListIntervalView> {
  int id;
  Future<Tree> futureTree;
  Tree tree;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
      future: futureTree,
      // this makes the tree of children, when available, go into snapshot.data
      builder: (context, snapshot) {
        // anonymous function
        if (snapshot.hasData) {
          int numChildren = snapshot.data.root.children.length;
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.root.name),
            ),
            body: ListView.separated(
              // it's like ListView.builder() but better because it includes a separator between items
              padding: const EdgeInsets.all(16.0),
              itemCount: numChildren,
              itemBuilder: (BuildContext context, int index) =>
                  _buildRow(snapshot.data.root.children[index], index),
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a progress indicator
        return Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }

  Widget _buildRow(MyInterval.Interval interval, int index) {
    String strDuration =
        Duration(seconds: interval.duration).toString().split('.').first;
    String strInitialDate = interval.initialDate.toString().split('.')[0];
    // this removes the microseconds part
    String strFinalDate = interval.finalDate.toString().split('.')[0];
    return IntervalCardView();
    return ListTile(
      title: Text('from ${strInitialDate} to ${strFinalDate}'),
      trailing: Text('$strDuration'),
    );
  }
}
