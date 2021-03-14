import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String name = 'Arif Waqas';
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFFFB8B8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0) ,
                    child: Text(
                      'Hello $name,',
                        style: TextStyle(
                          fontSize: 28,

                        )
                    ),
                  ),Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0) ,
                    child: Text(
                        'Welcome to',
                        style: TextStyle(
                          fontSize: 18,

                        )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0) ,
                    child: Text(
                        data['location']+"!",
                      style: TextStyle(
                        fontSize: 48,

                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(

              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Time:' + data['time'].toString()),
                  SizedBox(height: 30,),
                  Text('Day:' + data['day'])
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: TextButton(
                onPressed: () async {
                 dynamic result = await Navigator.pushNamed(context, '/location');
                 if(result!=null){
                    setState(() {
                      data['time'] = result['time'];
                      data['location'] = result['location'];
                      data['day'] = result['day'];
                    });
                  }
                },
                child: Text('Edit Location',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 32
                ),),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: TextButton(
                onPressed: () async {
                  dynamic response2 = await Navigator.pushNamed(context, '/name');
                  setState(() {
                    name = response2['name'];
                  });
                },
                child: Text('Change Name',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 32
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
