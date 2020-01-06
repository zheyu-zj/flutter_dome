import 'package:flutter/material.dart';
import 'package:flutter_dome/dome/stream/streat_dome.dart';
import 'dome/listview_dome.dart';
import 'dome/drawer_dome.dart';
import 'dome/bottom_navigation_bar_dome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, .5),
          splashColor: Colors.white70
          ),
      home: StreatDome(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("首页"),
          elevation: 0,
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: () {
          //     print("点击了菜单按钮");
          //   },
          // ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Navigration',
              onPressed: () {
                print("点击了菜单按钮");
              },
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'Navigration',
              onPressed: () {
                print("点击了菜单按钮");
              },
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDome(),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
        drawer: DrawerDome(),
        bottomNavigationBar: BottomNavigationBarDome(),
      ),
    );
  }
}
