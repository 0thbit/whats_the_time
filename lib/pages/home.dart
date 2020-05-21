import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute
        .of(context)
        .settings
        .arguments;

    //set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.grey[100] : Colors.grey[900];
    Color fontColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                dynamic timeData = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': timeData['time'],
                    'location': timeData['location'],
                    'isDayTime': timeData['isDayTime'],
                  };
                });
              },
              icon: Icon(Icons.edit_location,
                color: fontColor,),
              label: Text('Edit Location',
                style: TextStyle(
                  color: fontColor,
                ),),
            ),
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 27.0,
                    color: fontColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 90.0,
                color: fontColor,
              ),
            ),
          ],
        ),
    ),
    );
  }
}
