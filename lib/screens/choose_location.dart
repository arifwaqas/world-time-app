import 'package:flutter/material.dart';
import 'package:time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  String continentValue = continents[0];
  static List<String> continents = ['Europe', 'Asia'];
  static List<String> asiaValue = ['Pakistan','Iran', 'India'];
  static List<String> euroValue = ['London','Madrid', 'Paris'];
  static List<String> valueList2 = euroValue;

  String countryValue = 'London';

  void updateTime() async{
    String temp = continentValue+ "/"+ countryValue;
    WorldTime instance = WorldTime(location: countryValue, url: temp);
    try{
      await instance.getTime();
    }catch(e){
      instance.time = null;
      print("Could not fetch time!");
    }
    print(instance.time);
    print("Reached here!");
    Navigator.pop(context, {
      'location': instance.location,
      'time':instance.time,
      'day':instance.day
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFFFB8B8),
        body:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Container(

                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: continentValue,
                        onChanged: (String selection){ setState(() {
                          continentValue = selection;
                          if (selection == 'Europe'){
                            valueList2 = euroValue;
                          } else valueList2 = asiaValue;
                          countryValue = valueList2[0];
                        });},
                        items: continents.map<DropdownMenuItem<String>>(
                            (String value){
                              return DropdownMenuItem(
                                  value: value,
                                  child: Text(value));
                            }
                        ).toList(),
                      ),
                    ),
                    SizedBox(height: 30,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: countryValue,
                        onChanged: (String selection){ setState(() {
                          countryValue = selection;
                        });},
                        items: valueList2.map<DropdownMenuItem<String>>(
                                (String value){
                              return DropdownMenuItem(
                                  value: value,
                                  child: Text(value));
                            }
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80,),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: TextButton(
                  onPressed: () {
                    print(countryValue);
                    print(continentValue);
                    updateTime();
                  },
                  child: Text('Submit',
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 32
                    ),),
                ),
              ),

              SizedBox(height: 50,),

            ],
          ),
        ),
      ),
    );
  }
}
