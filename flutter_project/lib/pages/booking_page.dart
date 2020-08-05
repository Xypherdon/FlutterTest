import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_project/model/location.dart';
import 'package:flutter_project/model/location_table.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  Map data = {};

  Location location;

  @override
  void initState() {
    super.initState();
  }

  TableLocation tableLocation = TableLocation.inside;
  double sliderValue = 2;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    setState(() {
      location = data['location'];
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name, style: TextStyle()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                mobilePreferences: MobileMapPreferences(myLocationEnabled: true, myLocationButtonEnabled: false, rotateGesturesEnabled: false),
                initialZoom: 17,
                initialPosition: GeoCoord(location.coordinates.latitude, location.coordinates.longitude),
                markers: {Marker(GeoCoord(location.coordinates.latitude, location.coordinates.longitude))},
              ),
            ),
            Divider(height: 50),
            Text('Location:', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: TableLocation.inside,
                      groupValue: tableLocation,
                      onChanged: (TableLocation value) {
                        setState(() {
                          tableLocation = value;
                        });
                      },
                    ),
                    Text('Inside'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: TableLocation.outside,
                      groupValue: tableLocation,
                      onChanged: (TableLocation value) {
                        setState(() {
                          tableLocation = value;
                        });
                      },
                    ),
                    Text('Outside'),
                  ],
                ),
              ],
            ),
            Divider(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,25),
              child: Text('Number of places to book:', style: TextStyle(fontSize: 19)),
            ),
            Text(sliderValue.round().toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Slider(
              value: sliderValue,
              min: 1,
              max: 6,
              divisions: 5,
              label: sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: Text(
                'Book ${sliderValue.round()} ${sliderValue == 1 ? 'place' : 'places'} ${tableLocation == TableLocation.inside ? 'inside' : 'outside'} at ${location.name}?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Book'),
                ),
                RaisedButton(
                  onPressed: () {
                    print('Cancel');
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
