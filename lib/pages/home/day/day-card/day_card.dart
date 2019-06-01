import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';
import 'package:intl/intl.dart';
import 'package:journal/helpers/design/widgets/daily_task.dart';
import 'package:journal/helpers/design/widgets/list_tile.dart';

class DayCard extends StatelessWidget {
  final double taskListHeight;
  final bool isAddingTask;
  final bool needsValue;
  final List<dynamic> tasks;
  final List<Tag> tags;
  final Function addToTasksList;
  final Function removeFromTasksList;
  final Function updateNewTaskName;
  final Function updateNewTaskValue;
  final Function toggleCompleteTask;


  DayCard(
      {this.tasks,
      this.addToTasksList,
      this.removeFromTasksList,
      this.taskListHeight,
      this.tags,
      this.needsValue,
      this.isAddingTask,
      this.updateNewTaskName,
      this.updateNewTaskValue, this.toggleCompleteTask});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: width * 0.06),
                child: Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          isAddingTask
              ? Container(
                  padding: EdgeInsets.only(left: width * 0.043),
                  child: makeAddListTile(width, height, context, isAddingTask, needsValue,
                      updateNewTaskName, tags, updateNewTaskValue),
                )
              : Container(),
          tasks.length > 0
              ? Container(
                  height: height * taskListHeight,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      
                      return makeDailyTaskCard(context, width, height, index,
                          tasks[index], removeFromTasksList, toggleCompleteTask);
                    },
                  ),
                )
              : !isAddingTask
                  ? Container(
                      padding: EdgeInsets.only(left: width * 0.043),
                      child: makeAddListTile(width, height, context,
                          isAddingTask, needsValue, updateNewTaskName, tags, updateNewTaskValue),
                    )
                  : Container(),
          Container(height: height * 0.05),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Text(
                    'Daily Review',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(width * 0.065, height * 0.02, 0, 0),
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(hintText: 'Thoughts...'),
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () => print('editing complete'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
