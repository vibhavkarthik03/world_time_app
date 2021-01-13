import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime>locations = [

    WorldTime(url:'Asia/Kolkata',location:'India',flag:'india.jpg'),
    WorldTime(url:'Europe/London',location:'London',flag:'london.jpg'),
    WorldTime(url:'Europe/Berlin',location:'Athens',flag:'greece.jpg'),
    WorldTime(url:'Africa/Cairo',location:'Cairo',flag:'egypt.jpg'),
    WorldTime(url:'Africa/Nairobi',location:'Nairobi',flag:'kenya.jpg'),
    WorldTime(url:'America/Chicago',location:'Chicago',flag:'usa1.jpg'),
    WorldTime(url:'America/New_York',location:'New York',flag:'usa1.jpg'),
    WorldTime(url:'Asia/Seoul',location:'Seoul',flag:'sk.jpg'),
    WorldTime(url:'Asia/Jakarta',location:'Jakarta',flag:'indo.jpg'),


  ];

  void updateTime(index)async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build ran');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Select Region'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(itemCount:locations.length,
    itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          child: Card(
            color: Colors.grey[700],
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location,style: TextStyle(
                color: Colors.white
              ),),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
    },
    ));
  }
}
