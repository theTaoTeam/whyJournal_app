import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';

Widget makeListTile(double width, double height, BuildContext context,
    Map<String, dynamic> task, Function toggleCompleteTask) {
  // print(task);
  return ListTile(
    contentPadding: EdgeInsets.only(right: 100),
    title: Container(
      child: Text(
        task['title'],
        overflow: TextOverflow.ellipsis,
      ),
    ),
    leading: IconButton(
        splashColor: Colors.transparent,
        icon: !task['isComplete']
            ? Icon(
                Icons.radio_button_unchecked,
                color: Colors.grey,
                size: 29,
              )
            : Icon(
                Icons.check,
                color: Colors.pink,
                size: 29,
              ),
        onPressed: () {
          // print('pressing toggle');
          toggleCompleteTask(task['title']);
        }),
    subtitle: Container(
      margin: EdgeInsets.only(top: 5),
      child: Text(
        task['value'],
        style: TextStyle(fontSize: 16, color: Colors.pink),
      ),
    ),
  );
}

Widget makeAddListTile(
    double width,
    double height,
    BuildContext context,
    bool isAddingTask,
    Function updateNewTaskName,
    List<Tag> _tags,
    Function updateNewTaskValue) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    title: Container(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: 'Task Name',
                border: InputBorder.none,
              ),
              onChanged: (String val) {
                updateNewTaskName(val);
              },
            ),
            SelectableTags(
              tags: _tags,
              backgroundContainer: Colors.transparent,
              columns: 3,
              symmetry: true,
              singleItem: true,
              textColor: Colors.pink,
              textActiveColor: Colors.white,
              color: Colors.white,
              activeColor: Colors.pink,
              onPressed: (tag) {
                updateNewTaskValue(tag.title);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
