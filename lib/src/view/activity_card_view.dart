import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class ActivityCardViewL extends StatefulWidget {
  ActivityCardViewL(
      {this.type, this.activity, this.onPressCard, this.onPressButton});

  final dynamic activity;
  final ActivityType type;
  final void Function() onPressCard;
  final void Function() onPressButton;

  @override
  _ActivityCardViewLState createState() => _ActivityCardViewLState();
}

class _ActivityCardViewLState extends State<ActivityCardViewL> {
  dynamic activity;
  ActivityType type;
  void Function() onPressCard;
  void Function() onPressButton;
  @override
  void initState() {

    super.initState();
    activity = widget.activity;
    type = widget.type;
    onPressCard = widget.onPressCard;
    onPressButton = widget.onPressButton;
  }




  @override
  Widget build(BuildContext context) {
    {
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
                        tagCardView(),
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
                        tagCardView(),
                      ],
                    ),
                    ShowTimeView(
                      type: ActivityType.project,
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
                        tagCardView(),
                      ],
                    ),
                    ShowTimeView(
                      type: ActivityType.project,
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
}

class ActivityCardView extends StatelessWidget {
  final dynamic activity;
  final ActivityType type;
  final void Function() onPressCard;
  final void Function() onPressButton;

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
                      tagCardView(),
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
                      tagCardView(),
                    ],
                  ),
                  ShowTimeView(
                    type: ActivityType.project,
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
                      tagCardView(),
                    ],
                  ),
                  ShowTimeView(
                    type: ActivityType.project,
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
