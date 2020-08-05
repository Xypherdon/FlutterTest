import 'package:flutter/material.dart';
import 'package:flutter_project/model/location.dart';
import 'package:flutter_project/model/location_table.dart';
import 'package:flutter_project/pages/location_card.dart';
import 'package:geolocator/geolocator.dart';

class PlacesList extends StatefulWidget {
  final Position devicePosition;
  final List<Location> locations;

  const PlacesList({Key key, @required this.devicePosition, @required this.locations}) : super(key: key);

  @override
  _PlacesListState createState() => _PlacesListState(devicePosition: devicePosition, locations: locations);
}

class _PlacesListState extends State<PlacesList> with AutomaticKeepAliveClientMixin<PlacesList> {
  Position devicePosition;
  List<Location> locations;

  _PlacesListState({this.devicePosition, this.locations});

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
          child: LocationCard(location: locations[index]),
        );
      },
    );
  }
}
