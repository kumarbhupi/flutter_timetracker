import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/bloc/bloc.dart';
import 'package:timetracker_flutter/src/core/core.dart';
import 'package:timetracker_flutter/src/view/view.dart';

class ListActivitiesView extends StatelessWidget {
  final _fetchActivitiesBloc = FetchActivitiesBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
        future: _fetchActivitiesBloc.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('${snapshot.data}');
            return ListView.builder(
                itemCount: snapshot.data.root.children.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _buildRow(snapshot.data.root.children[index], index)
                    ],
                  );
                });
          }
          if (snapshot.hasError) {
            return Text('No data found');
          }
          return Text('Default...');
        });
  }

  Widget _buildRow(Activity activity, int index) {
    //String strDuration =
    //    Duration(seconds: activity.duration).toString().split('.').first;
    // split by '.' and taking first element of resulting list removes the microseconds part
    if (activity is Project) {
      return ActivityCardView(
          activity: activity, type: ActivityType.pausedTask);
    } else if (activity is Task) {
      return ActivityCardView(
          activity: activity, type: ActivityType.pausedTask);
    }
  }
}
