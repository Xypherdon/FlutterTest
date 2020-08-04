class LocationTable {
  int id;
  TableLocation tableLocation;
  int numberOfPlaces;
  bool occupied;

  LocationTable(this.id,this.tableLocation, this.numberOfPlaces);
}

enum TableLocation {
  outside,
  inside,
}
