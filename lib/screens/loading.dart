import 'package:flutter/material.dart';
import 'package:time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getWorldTime() async{
    WorldTime instance = WorldTime(location: 'London', url: 'Europe/London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time':instance.time,
      'day':instance.day,
    });
  }


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(child:
      Text("Loading...")),
    );
  }
}
