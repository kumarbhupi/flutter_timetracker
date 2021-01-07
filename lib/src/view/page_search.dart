import 'package:flutter/material.dart';
import 'package:timetracker_flutter/page_activities.dart';
import 'package:timetracker_flutter/page_intervals.dart';
import 'package:timetracker_flutter/src/services/services.dart';
import 'package:timetracker_flutter/src/core/core.dart';


class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";
  Activity selectedActivity;

  @override
  Widget buildResults(BuildContext context) {
    if(selectedActivity is Task){
      return PageIntervals(selectedActivity.id, (selectedActivity as Task).active);
    }else if(selectedActivity is Project){
      return PageActivities(selectedActivity.id);
    }

    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;

  Search(this.listExample);

  List<String> recentList = ["Text 4", "Text 3"];
  Future<List<Tree>> futureTree;

  @override
  Widget buildSuggestions(BuildContext context) {
    futureTree = getTreeByTag(query.characters.string);

    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return FutureBuilder<List<Tree>>(
      future: futureTree,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data[index].root.name,
                  ),
                  leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
                  onTap: () {
                    selectedActivity = snapshot.data[index].root;
                    showResults(context);
                  },
                );
              });

        }
        return ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  suggestionList[index],
                ),
                leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
                onTap: () {
                  selectedResult = suggestionList[index];

                  showResults(context);
                },
              );
            });
      },
    );
  }
}
