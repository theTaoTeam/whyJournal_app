import 'package:flutter/material.dart';

import 'day/day.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            leading: Container(),
            title: Container(),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.settings,
                  color: Colors.pink,
                ),
              )
            ],
            bottom: TabBar(
              indicatorPadding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              indicatorWeight: 3,
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              labelStyle: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 1),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'DAY'),
                Tab(text: 'WEEK'),
                Tab(text: 'MONTH'),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: height * 0.08),
          color: Colors.white,
          child: TabBarView(
            children: <Widget>[
              DayPage(),
              Center(
                child: Text('WEEK'),
              ),
              Center(
                child: Text('MONTH'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
