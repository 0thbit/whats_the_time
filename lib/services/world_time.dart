import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to flag image asset
  String url; // the location url for API endpoint
  bool isDayTime; // flag to set daytime theme

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      this.time = DateFormat.jm().format(now);
      this.isDayTime = now.hour >= 6 && now.hour <= 19 ? true : false;

    } catch (e) {
      this.time = "invalid";
    }
  }
}
