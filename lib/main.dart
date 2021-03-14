import 'package:flutter/material.dart';
import 'package:time_app/screens/change_name.dart';
import './screens/loading.dart';
import './screens/choose_location.dart';
import './screens/home.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
      '/name' : (context) => ChangeName(),
    },
  ));
}
