import 'package:flutter/material.dart';
import 'package:flutter_project/model/location.dart';
import 'package:flutter_project/model/location_table.dart';
import 'package:geolocator/geolocator.dart';

class PlacesList extends StatefulWidget {

  Position devicePosition;
  List<Location> locations;

  PlacesList({Key key, @required this.devicePosition,@required this.locations}) :super(key: key);

  @override
  _PlacesListState createState() => _PlacesListState(devicePosition: devicePosition,locations:locations);
}

class _PlacesListState extends State<PlacesList> {

  Position devicePosition;
  List<Location> locations;
  _PlacesListState({this.devicePosition,this.locations});

  @override
  Widget build(BuildContext context) {

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

