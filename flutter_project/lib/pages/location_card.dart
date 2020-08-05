import 'package:flutter/material.dart';
import 'package:flutter_project/model/location.dart';

class LocationCard extends StatefulWidget {
  final Location location;

  const LocationCard({Key key, @required this.location}) : super(key: key);

  @override
  _LocationCardState createState() => _LocationCardState(location: location);
}

class _LocationCardState extends State<LocationCard> {
  Location location;

  _LocationCardState({this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: Text(location.name, style: TextStyle(fontSize: 25.0,color:Colors.grey[700])),
            ),
            Image.asset(
              'assets/terasa.jpg',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0,0,0),
              child: Row(
                children: <Widget>[
                  Expanded(flex:1,child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('${location.countOccupied()}/${location.tables.length}',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Text('occupied'),
                    ],
                  )),
                  Expanded(
                    flex:4,
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              print('Book places for ${location.name}');
                              Navigator.pushNamed(context, '/booking',arguments: {
                                'location':location,
                              });
                            },
                            child: Text('Book places')),
                        FlatButton(
                            onPressed: () {
                              print('View location for ${location.name}');
                            },
                            child: Text('View location')),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ));
  }
}
