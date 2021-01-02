import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class ActivityCardView extends StatelessWidget {
  final dynamic activity;
  final ActivityType type;

  ActivityCardView({this.type, this.activity});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ActivityType.project:
        {
          return Card(
            color: Colors.white,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ActivityNameView(activity: activity,),
                    tagCardView(),
                  ],
                ),
                ShowTimeView(type: ActivityType.project, activity: activity,),
                Container(
                  child: Align(
                    child: PlayerButtonView(type: ActivityType.project),
                  ),
                ),
              ],
            ),
          );
        }
        break;

      case ActivityType.playingTask:
        {
          return Card(
            color: Colors.white,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ActivityNameView(activity: activity,),
                    tagCardView(),
                  ],
                ),
                ShowTimeView(type: ActivityType.project, activity: activity,),
                Container(
                  child: Align(
                    child: PlayerButtonView(type: ActivityType.playingTask),
                  ),
                ),
              ],
            ),
          );
        }
        break;

      case ActivityType.pausedTask:
        {
          return Card(
            color: Colors.white,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ActivityNameView(activity: activity,),
                    tagCardView(),
                  ],
                ),
                ShowTimeView(type: ActivityType.project, activity: activity,),
                Container(
                  child: Align(
                    child: PlayerButtonView(type: ActivityType.pausedTask),
                  ),
                ),
              ],
            ),
          );
        }
        break;

      default:
        {
          return null;
        }
        break;
    }
  }
}
