import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_project/model/location_table.dart';

class Location{
  String name;
  int id;
  List<LocationTable> tables;
  GeoCoord coordinates;

  Location({this.id, this.name, this.tables, this.coordinates});

  int countOccupied(){
    int occupiedTables=0;
    tables.forEach((table){
      occupiedTables = table.occupied ? occupiedTables+1 : occupiedTables;
    });
    return occupiedTables;
  }
}
