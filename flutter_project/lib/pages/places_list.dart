import 'package:flutter/material.dart';
import 'package:flutter_project/model/location.dart';
import 'package:flutter_project/model/location_table.dart';

class PlacesList extends StatefulWidget {
  @override
  _PlacesListState createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {

  List<Location> locations;

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

    locations = [
      Location(1, "Restaurant 1", tables),
      Location(1, "Restaurant 2", tables),
      Location(1, "Restaurant 3", tables),
      Location(1, "Restaurant 4", tables),
      Location(1, "Restaurant 5", tables),
      Location(1, "Restaurant 6", tables),
    ];
  }

  @override
  Widget build(BuildContext context) {
    prepareLocations();
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(locations[index].name, style: TextStyle(fontSize: 25.0)),
                  Image.asset(
                    'assets/terasa.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            print('Book places for ${locations[index].name}');
                          },
                          child: Text('Book places')),
                      FlatButton(
                          onPressed: () {
                            print('View location for ${locations[index].name}');
                          },
                          child: Text('View location')),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}

