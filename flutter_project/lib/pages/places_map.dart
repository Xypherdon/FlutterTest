import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_project/model/location.dart';
import 'package:geolocator/geolocator.dart';

class PlacesMap extends StatefulWidget {
  Position devicePosition;
  List<Location> locations;
  PlacesMap({Key key, @required this.devicePosition,@required this.locations}) : super(key: key);

  @override
  _PlacesMapState createState() => _PlacesMapState(devicePosition: devicePosition,locations: this.locations);
}

class _PlacesMapState extends State<PlacesMap> {
  Position devicePosition;
  List<Location> locations;
  _PlacesMapState({this.devicePosition,this.locations});

  Set<Marker> markers;

  @override
  void initState() {
    super.initState();

    markers = locations.map((location)=>Marker(location.coordinates,info: location.name)).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: GoogleMap(
          initialPosition: GeoCoord(devicePosition != null ? devicePosition.latitude : 46.7801955, devicePosition != null ? devicePosition.longitude : 23.63138),
          initialZoom: 16,
          interactive: true,
          markers: markers,
          mobilePreferences: MobileMapPreferences(
            compassEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          ),
        ))
      ],
    );
  }
}
