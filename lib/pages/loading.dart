import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime laTime = WorldTime(
        location: 'Los Angeles',
        flag: 'america.png',
        url: 'America/Los_Angeles');
    await laTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': laTime.location,
      'flag': laTime.flag,
      'time': laTime.time,
      'isDayTime': laTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitCubeGrid(
                size: 108.0,
                color: Colors.yellow[500]),
            SizedBox(height: 90,),
            Text('World Time',
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 40,
              ),)
          ],
        ),
      ),
    );
  }
}
