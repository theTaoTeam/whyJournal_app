import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';

Widget makeListTile(double width, double height, BuildContext context,
    Map<String, dynamic> task, Function toggleCompleteTask) {
  print(task);
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    title: Container(
      child: Text(
        task['title'],
        overflow: TextOverflow.ellipsis,
      ),
    ),
    leading: Container(
      // width: width * 0.01,
      child: IconButton(
          icon: !task['isComplete']
              ? Icon(Icons.radio_button_unchecked)
              : Icon(
                  Icons.check,
                  color: Colors.pink,
                ),
          onPressed: () {
            print('pressing toggle');
            toggleCompleteTask(task['title']);
          }),
    ),
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
    bool needsValue,
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
            needsValue ? Text('Select a value for your task',style: TextStyle( color: Colors.red)) : Container(),
            TextField(
              autofocus: true,
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
            )
          ],
        ),
      ),
    ),
  );
}
