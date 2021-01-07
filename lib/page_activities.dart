import 'package:flutter/material.dart';
import 'package:timetracker_flutter/page_intervals.dart';
import 'package:timetracker_flutter/src/core/core.dart';
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:timetracker_flutter/src/services/services.dart';
import 'dart:async';

class PageActivities extends StatefulWidget {
  int id;
  String parentName;

  PageActivities(this.id, this.parentName);

  @override
  _PageActivitiesState createState() => _PageActivitiesState();
}

class _PageActivitiesState extends State<PageActivities> {
  int id;
  Future<Tree> futureTree;
  Timer _timer;
  static const int periodeRefresh = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    futureTree = getTree(id);

    _activateTimer();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
      future: futureTree,
      // this makes the tree of children, when available, go into snapshot.data
      builder: (context, snapshot) {
        // anonymous function
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${widget.parentName}/${snapshot.data.root.name}"),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(context: context, delegate: Search([]));
                    }),
              ],
            ),
            body: ListView.separated(
              // it's like ListView.builder() but better because it includes a separator between items
              itemCount: snapshot.data.root.children.length,
              itemBuilder: (BuildContext context, int index) =>
                  _buildRow(snapshot.data.root.children[index], index, snapshot.data.root.name),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
            floatingActionButton: OptionsMenuView(
              id: id,
              activities: snapshot.data.root.children,
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

  Widget _buildRow(Activity activity, int index, String name) {
    if (activity is Project) {
      if (activity.active) {
        return ActivityCardView(
          type: ActivityType.activeProject,
          activity: activity,
          onPressCard: () =>
              _navigateDownActivities(activity.id, name),
          onPressButton: () {},
        );
      }
      return ActivityCardView(
        type: ActivityType.project,
        activity: activity,
        onPressCard: () =>
            _navigateDownActivities(activity.id, name),
        onPressButton: () {},
      );
    } else if (activity is Task) {
      if (((activity).active)) {
        return ActivityCardView(
          type: ActivityType.playingTask,
          activity: activity,
          onPressCard: () =>
              _navigateDownIntervals(activity.id, (activity).active, name),
          onPressButton: () {
            stop(activity.id);
            _refresh();
          },
        );
      } else {
        return ActivityCardView(
          type: ActivityType.pausedTask,
          activity: activity,
          onPressCard: () =>
              _navigateDownIntervals(activity.id, (activity).active, name),
          onPressButton: () {
            start(activity.id);
            _refresh();
          },
        );
      }
    }
  }

  void _navigateDownActivities(int childId, String parentName) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(
      builder: (context) => PageActivities(childId, parentName),
    ))
        .then((var value) {
      _activateTimer();
      _refresh();
    });
  }

  void _navigateDownIntervals(int childId, bool active, String parentName) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(
      builder: (context) => PageIntervals(childId, active, parentName),
    ))
        .then((var value) {
      _activateTimer();
      _refresh();
    });
  }

  void _refresh() async {
    futureTree = getTree(id); // to be used in build()
    setState(() {});
  }

  void _activateTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: periodeRefresh), (Timer t) {
        futureTree = getTree(id);
        setState(() {});
      });
    }
    if (!_timer.isActive) {
      _timer = Timer.periodic(Duration(seconds: periodeRefresh), (Timer t) {
        futureTree = getTree(id);
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    // "The framework calls this method when this State object will never build again"
    // therefore when going up
    print('Lo hace en el activities?');
    _timer.cancel();
    super.dispose();
  }
}
