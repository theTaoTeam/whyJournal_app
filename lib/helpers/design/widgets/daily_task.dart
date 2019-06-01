import 'package:flutter/material.dart';
import 'package:journal/helpers/design/widgets/list_tile.dart';

Widget makeDailyTaskCard(BuildContext context, double width, double height,
    int index, Map<String,dynamic> task, Function removeFromTasksList, Function toggleCompleteTask) {
  final Key _dismissKey = Key(task['title']);
  Future<bool> _showDeleteConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to delete this item?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.pop(context, true); // showDialog() returns true
                removeFromTasksList(index);
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context, false); // showDialog() returns false
              },
            ),
          ],
        );
      },
    );
  }

  return Dismissible(
    key: _dismissKey,
    direction: DismissDirection.endToStart,
    background: Container(
      color: Colors.pink.withOpacity(0.8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.only(right: width * 0.06),
          child: Icon(Icons.delete, size: 38, color: Colors.white),
        ),
      ),
    ),
    confirmDismiss: ((DismissDirection direction) async {
      await _showDeleteConfirmationDialog(context);
    }),
    child: Card(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        margin: EdgeInsets.only(left: width * 0.05),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.3, color: Colors.grey.shade600))),
        child: makeListTile(width, height, context, task, toggleCompleteTask),
      ),
    ),
  );
}
