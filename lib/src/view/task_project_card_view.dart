import 'package:flutter/material.dart';
import 'package:intl/number_symbols.dart';
import 'package:timetracker_flutter/src/view/view.dart';
import 'package:timetracker_flutter/src/core/core.dart';

class TaskProjectCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [ Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            taskProjectNameView(),
            tagCardView(),
          ],
        ),
          ShowTimeView(type: ButtonType.project),
          Container(
            child: Align(
              child: PlayerButtonView(type: ButtonType.project),
            ),
          ),
        ],
      ),
    );
  }
}
