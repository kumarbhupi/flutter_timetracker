import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class ActivityCardView extends StatelessWidget {
  final dynamic activity;
  final ActivityType type;
  final void Function() onPressCard;
  final void Function() onPressButton;

  List<Widget> _createAllTags(List<dynamic> names) {
    List<Widget> allTags = new List<Widget>();
    for (String string in names) {
      allTags.add(TagCardView(
        tagName: string,
      ));
    }
    return allTags;
  }

  ActivityCardView(
      {this.type, this.activity, this.onPressCard, this.onPressButton});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ActivityType.project:
        {
          return InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: onPressCard,
            child: Card(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ActivityNameView(
                        activity: activity,
                      ),
                      SingleChildScrollView(
                        child: Row(
                          children: _createAllTags((activity as Activity).tags),
                        ),
                      ),
                    ],
                  ),
                  ShowTimeView(
                    type: ActivityType.project,
                    activity: activity,
                  ),
                  Container(
                    child: Align(
                      child: PlayerButtonView(
                        type: ActivityType.project,
                        onPressAction: onPressCard,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        break;

      case ActivityType.playingTask:
        {
          return Card(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: onPressCard,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ActivityNameView(
                        activity: activity,
                      ),
                      SingleChildScrollView(
                        child: Row(
                          children: _createAllTags((activity as Activity).tags),
                        ),
                      ),
                    ],
                  ),
                  ShowTimeView(
                    type: ActivityType.playingTask,
                    activity: activity,
                  ),
                  Container(
                    child: Align(
                      child: PlayerButtonView(

                        type: ActivityType.playingTask,
                        onPressAction: onPressButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        break;

      case ActivityType.pausedTask:
        {
          return Card(
            color: Colors.white,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: onPressCard,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ActivityNameView(
                        activity: activity,
                      ),
                      SingleChildScrollView(
                        child: Row(
                          children: _createAllTags((activity as Activity).tags),
                        ),
                      ),
                    ],
                  ),
                  ShowTimeView(
                    type: ActivityType.pausedTask,
                    activity: activity,
                  ),
                  Container(
                    child: Align(
                      child: PlayerButtonView(
                        type: ActivityType.pausedTask,
                        onPressAction: onPressButton,
                      ),
                    ),
                  ),
                ],
              ),
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
