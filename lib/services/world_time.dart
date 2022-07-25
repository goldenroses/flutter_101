import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time="";
  String flag;
  String url; //
  bool isDaytime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties
      String datetime = data['datetime'];
      int offset = int.parse(data['utc_offset'].substring(1, 3));

      // create date time object
      DateTime datetimeNow = DateTime.parse(datetime);
      datetimeNow = datetimeNow.add(Duration(hours: offset));

      time = DateFormat.jm().format(datetimeNow);

      isDaytime = (datetimeNow.hour> 6 && datetimeNow.hour <20) ? true : false;


    } catch(error) {
      print(error);
      time = "Could not set time date";
    }
  }



// location
}



