import 'package:flutter/material.dart';
import 'package:flutter_project/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes:{
  '/':(context) => Home(),
  }
));

