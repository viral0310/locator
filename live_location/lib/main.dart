import 'package:flutter/material.dart';
import 'package:live_location/screens/current%20location.dart';
import 'package:live_location/screens/map%20screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/current_location',
    routes: {
      // '/': (context) => MapScreen(),
      '/current_location': (context) => const CurrentLocation(),
    },
  ));
}
