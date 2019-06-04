import 'package:flutter/material.dart';
import 'package:hello_world_f_orm_m8/views/gym_location_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'f-orm-m8 Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GymLocationsPage(),
    );
  }
}
