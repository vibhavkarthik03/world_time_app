import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  void setUpWorldTime()async{
    WorldTime instance = WorldTime(location: 'India',flag: 'india.jpg',url:'Asia/Kolkata');
    await instance.getTime();
     Navigator.pushReplacementNamed(context, '/home',arguments:{
       'location':instance.location,
       'flag':instance.flag,
       'time':instance.time,
       'isDayTime':instance.isDayTime,
     } );


  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SpinKitHourGlass(
            color: Colors.amber,
            size: 60.0,
          ),
      ),
    );
  }
}
