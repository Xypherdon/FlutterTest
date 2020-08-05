import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_project/model/location.dart';
import 'package:flutter_project/model/location_table.dart';
import 'package:flutter_project/pages/places_list.dart';
import 'package:flutter_project/pages/places_map.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Position devicePosition;
  List<Location> locations;
  TabController tabController;
  List<Tab> tabs = [
    Tab(icon: Icon(Icons.list)),
    Tab(icon: Icon(Icons.map)),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    getPosition();
    prepareLocations();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void getPosition() async {
    Position currentPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      devicePosition = null; // CHANGE!!
    });
  }

  void prepareLocations() {
    List<LocationTable> tables = [
      LocationTable(1, TableLocation.inside, 3),
      LocationTable(2, TableLocation.inside, 2),
      LocationTable(3, TableLocation.inside, 4),
      LocationTable(4, TableLocation.inside, 4),
      LocationTable(5, TableLocation.inside, 2),
      LocationTable(6, TableLocation.outside, 3),
      LocationTable(7, TableLocation.outside, 6),
      LocationTable(8, TableLocation.outside, 4),
      LocationTable(9, TableLocation.outside, 2),
      LocationTable(10, TableLocation.outside, 2),
    ];
    setState(() {
      locations = [
        Location(id: 1, name: "Restaurant 1", tables: tables, coordinates: GeoCoord(46.781960, 23.627100)),
        Location(id: 2, name: "Restaurant 2", tables: tables, coordinates: GeoCoord(46.780935, 23.632147)),
        Location(id: 3, name: "Restaurant 3", tables: tables, coordinates: GeoCoord(46.778892, 23.629643)),
        Location(id: 4, name: "Restaurant 4", tables: tables, coordinates: GeoCoord(46.779164, 23.636638)),
        Location(id: 5, name: "Restaurant 5", tables: tables, coordinates: GeoCoord(46.781754, 23.636407)),
        Location(id: 6, name: "Restaurant 6", tables: tables, coordinates: GeoCoord(46.778479, 23.632123)),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (devicePosition != null) {
      print("Current Position: ${devicePosition.latitude} ${devicePosition.longitude}");
    }
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
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: <Widget>[
            PlacesList(
              devicePosition: devicePosition,
              locations: locations,
            ),
            PlacesMap(
              devicePosition: devicePosition,
              locations: locations,
            ),
          ],
        ));
  }
}
