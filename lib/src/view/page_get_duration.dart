import 'package:flutter/material.dart';
import 'package:timetracker_flutter/src/core/core.dart';
import 'dart:collection';
import 'package:timetracker_flutter/src/services/services.dart';
import 'package:timetracker_flutter/src/view/view.dart';
class InformationTimeDialog extends StatefulWidget {
  InformationTimeDialog({this.id, this.activities});

  int id;
  List<dynamic> activities;

  @override
  _InformationTimeDialogState createState() => _InformationTimeDialogState();
}

class _InformationTimeDialogState extends State<InformationTimeDialog> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedEndDate = DateTime.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  HashMap nameIdMap = new HashMap<String, int>();
  String dropdownValue = 'All';

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  _selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedEndDate)
      setState(() {
        selectedEndDate = picked;
      });
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedEndTime);
    if (picked != null && picked != selectedEndTime)
      setState(() {
        selectedEndTime = picked;
      });
  }

  List<DropdownMenuItem<String>> _getDropDownMenuItems() {
    List<DropdownMenuItem<String>> activitiesName =
        List<DropdownMenuItem<String>>();
    activitiesName.add(DropdownMenuItem(value: 'All', child: Text('All')));
    nameIdMap['All'] = widget.id;
    for (Activity activity in widget.activities) {
      nameIdMap[activity.name] = activity.id;
      activitiesName.add(
          DropdownMenuItem(value: activity.name, child: Text(activity.name)));
    }
    return activitiesName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get duration'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 7.0),
                          alignment: Alignment.centerLeft,
                          child: Text('Start date: '),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: RaisedButton(
                                onPressed: () => _selectDate(context), // Refer step 3
                                child: Text(
                                  'Select date',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 7.0),
                          alignment: Alignment.centerLeft,
                          child: Text('Start time: '),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 55.0,
                              child: Text(
                                "${selectedTime.hour}:${selectedTime.minute}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(left: 72.0),
                              child: RaisedButton(
                                onPressed: () => _selectTime(context), // Refer step 3
                                child: Text(
                                  'Select time',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 14.0),
                          alignment: Alignment.centerLeft,
                          child: Text('End date: '),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${selectedEndDate.toLocal()}".split(' ')[0],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10.0),
                              child: RaisedButton(
                                onPressed: () => _selectEndDate(context),
                                // Refer step 3
                                child: Text(
                                  'Select date',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 14.0),
                          alignment: Alignment.centerLeft,
                          child: Text('End time: '),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 55.0,
                              child: Text(
                                "${selectedEndTime.hour}:${selectedEndTime.minute}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(left: 72.0),
                              child: RaisedButton(
                                onPressed: () => _selectEndTime(context),
                                // Refer step 3
                                child: Text(
                                  'Select time',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: _getDropDownMenuItems(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      onPressed: () {
                        Future<int> totalDuration = getTotalDuration(
                          nameIdMap[dropdownValue], selectedDate, selectedTime,
                        selectedEndDate, selectedEndTime);
                        showDurationDialog(context, totalDuration);
                      },
                      // Refer step 3
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.blue[500],
                    ),
                  ),
                )
              ], //children
            ),
          ),
        ),
      ),
    );
  }
}
