import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:flutter_project/pages/booking_page.dart';
import 'package:flutter_project/pages/home.dart';

void main() {
  GoogleMap.init('API_KEY');
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Home(),
    '/booking': (context) => BookingPage(),
  }));
}
