import 'package:flutter_project/model/location_table.dart';

class Location{
  String name;
  int id;
  List<LocationTable> tables;

  Location(this.id, this.name,  this.tables);
}
