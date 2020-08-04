import 'package:flutter/material.dart';
import 'package:flutter_project/model/location.dart';
import 'package:flutter_project/model/location_table.dart';
import 'package:flutter_project/pages/places_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {


  TabController tabController;
  List<Tab> tabs = [
    Tab(icon: Icon(Icons.list)),
    Tab(icon: Icon(Icons.map)),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Places'),
          centerTitle: true,
          bottom: TabBar(
            controller: tabController,
            tabs: tabs,
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ))),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        )),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            PlacesList(),
            Text('test'),
          ],
        ));
  }
}
