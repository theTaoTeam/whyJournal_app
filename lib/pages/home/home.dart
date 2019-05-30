import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Container(),
        actions: <Widget>[],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(child: Text('Home Page')),
    );
  }
}
