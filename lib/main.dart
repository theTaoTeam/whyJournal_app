import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:journal/pages/home/home.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildApp(context);
    // return ScopedModel<MainModel>(
    //   model: _model,
    //   child: _buildApp(context),
    // );
  }
}

Widget _buildApp(BuildContext context) {
  return MaterialApp(
    theme: ThemeData.dark(),
    routes: {
      '/': (BuildContext context) => HomePage(),
    },
    onUnknownRoute: (RouteSettings settings) {
      return MaterialPageRoute(
        builder: (BuildContext context) => HomePage(),
      );
    },
  );
}
