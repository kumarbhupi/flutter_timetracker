import 'package:flutter/material.dart';
import 'package:timetracker_flutter/page_activities.dart';
import 'package:timetracker_flutter/src/core/core.dart';
import 'package:timetracker_flutter/src/core/interval.dart' as myInterval;
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:timetracker_flutter/src/services/services.dart';
import 'dart:async';

// to avoid collision with an Interval class in another library
class PageIntervals extends StatefulWidget {
  int id;
  String name;
  bool active;

  PageIntervals(this.id, this.active, this.name);

  @override
  _PageIntervalsState createState() => _PageIntervalsState();
}

class _PageIntervalsState extends State<PageIntervals> {
  int id;
  Future<Tree> futureTree;
  Tree tree;
  Timer _timer;
  static const int refreshPeriod = 2;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    futureTree = getTree(id);
    _activateTimer();

  }

  void _activateTimer() {
    _timer = Timer.periodic(Duration(seconds: refreshPeriod), (Timer t) {
      futureTree = getTree(id);
      setState(() {});
    });
  }

  @override
  void dispose() {
    print('Cancel del interval');
    _timer.cancel();
    super.dispose();
  }

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
              title: Text("${widget.name}/${snapshot.data.root.name}"),
            ),
            body: ListView.separated(
              // it's like ListView.builder() but better because it includes a separator between items
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

  Widget _buildRow(myInterval.Interval interval, int index) {
    String strDuration =
        Duration(seconds: interval.duration).toString().split('.').first;
    String strInitialDate = interval.initialDate.toString().split('.')[0];
    // this removes the microseconds part
    String strFinalDate = interval.finalDate.toString().split('.')[0];
    return IntervalCardView(activity: interval, number : index);

  }
}
