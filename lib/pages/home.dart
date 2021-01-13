import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

   data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
   print(data);


   // set background
   String bgImage = data['isDayTime'] ? 'Sierra Flare.png' : 'Smoke Show.png';
   Color bgColor = data['isDayTime'] ? Colors.blue[900] : Colors.indigo[900];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit:BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
            children: <Widget>[
              CircleAvatar(backgroundImage: AssetImage('assets/logo2.png'),radius: 30.0,backgroundColor: Colors.white,
              ),
              SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4.0,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0
                  ),
                ),
              SizedBox(
                height: 190,
              ),FlatButton.icon(onPressed: ()async{
                dynamic result =  await Navigator.pushNamed(context, '/location');
                setState(() {
                  data ={
                    'time':result['time'],
                    'location':result['location'],
                    'isDayTime': result['isDayTime'],
                    'flag':result['flags'],
                  };
                });
              },
                icon: Icon(Icons.edit_location_outlined,
                  size: 28,
                  color: Colors.white,),
                label: Text('Change Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,

                  ),)
                ,),
            ],
          ),),
        ),
      ),
    );
  }
}
