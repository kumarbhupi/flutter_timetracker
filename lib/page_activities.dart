import 'package:flutter/material.dart';
import 'package:timetracker_flutter/page_intervals.dart';
import 'package:timetracker_flutter/tree.dart' hide getTree;
// the old getTree()
import 'package:timetracker_flutter/requests.dart';
// has the new getTree() that sends an http request to the server



class PageActivities extends StatefulWidget {
  int id;
  PageActivities(this.id);

  @override
  _PageActivitiesState createState() => _PageActivitiesState();
}

class _PageActivitiesState extends State<PageActivities> {
  int id;
  Future<Tree> futureTree;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    futureTree = getTree(id);
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
              title: Text(snapshot.data.root.name),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {} // TODO go home page = root
                    ),
                //TODO other actions
              ],
            ),
            body: ListView.separated(
              // it's like ListView.builder() but better because it includes a separator between items
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data.root.children.length,
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

  Widget _buildRow(Activity activity, int index) {
    String strDuration =
        Duration(seconds: activity.duration).toString().split('.').first;
    // split by '.' and taking first element of resulting list removes the microseconds part
    if (activity is Project) {
      return ListTile(
        title: Text('${activity.name}'),
        trailing: Text('$strDuration'),
        onTap: () => _navigateDownActivities(activity.id),
      );
    } else if (activity is Task) {
      Task task = activity as Task;
      // at the moment is the same, maybe changes in the future
      Widget trailing;
      trailing = Text('$strDuration');

      return ListTile(
        title: Text('${activity.name}'),
        trailing: trailing,
        onTap: () => _navigateDownIntervals(activity.id),
        onLongPress: () {}, // TODO start/stop counting the time for tis task
      );
    }
  }

  void _navigateDownActivities(int childId) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => PageActivities(childId),
    ));
  }

  void _navigateDownIntervals(int childId) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => PageIntervals(childId),
    ));
  }
}
