import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String url;
  String time;
  String day;

  WorldTime({this.location, this.url});

  Future<void> getTime() async{
    print(url);
    Response response = await get(Uri.http('worldclockapi.com','api/json/est/now'));
    Map data = jsonDecode(response.body);
    String datetime = data['currentDateTime'];
    day = data['dayOfTheWeek'];
    DateTime now = DateTime.parse(datetime);
    time = DateFormat.jm().format(now);
  }


}