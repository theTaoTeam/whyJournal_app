import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DayPageState();
  }
}

class _DayPageState extends State<DayPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 7, initialIndex: 3);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.15),
          child: TabBar(
            controller: _tabController,
            indicatorPadding: EdgeInsets.fromLTRB(39, 0, 39, 0),
            indicatorWeight: 3,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1),
            tabs: [
              Text('SUN'),
              Text('MON'),
              Text('TUE'),
              Text('WED'),
              Text('THU'),
              Text('FRI'),
              Text('SAT'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Center(child: Text('SUN')),
            Center(child: Text('MON')),
            Center(child: Text('TUE')),
            Center(child: Text('WED')),
            Center(child: Text('THU')),
            Center(child: Text('FRI')),
            Center(child: Text('SAT')),
          ],
        ),
      ),
    );
  }
}
