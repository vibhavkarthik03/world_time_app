import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

  String location; // location for ui
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDayTime; //t/f day or night

  WorldTime({this.location,this.flag,this.url});

 Future<void> getTime() async {

   try{
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
     Map data = jsonDecode(response.body);
     // print(data);

     //properties from data
     String datetime = data['datetime'];
     String offset1= data['utc_offset'].substring(1,3);
     String offset2= data['utc_offset'].substring(4,6);

     // print(datetime);
     //print(offset);

     //create a datetime object
     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours:int.parse(offset1),minutes: int.parse(offset2)));

     //set time property
     isDayTime = now.hour > 6 && now.hour < 19 ? true : false ;
     time = DateFormat.jm().format(now);
   }
   catch(e){
     print('cought error:$e');
     time= 'Could not load time, make sure you are connected to internet';
   }

    //make request


  }

}

