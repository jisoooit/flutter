import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;
 

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  
  String city="";
  int temp=0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData){

    double temp2=weatherData['main']['temp'];
    temp=temp2.toInt(); //round() 반올림 해도 됨 ㅋ
    city=weatherData['name'];
    print(temp);
    print(city);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$city',
            style:TextStyle(
              fontSize:30.0
            )
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('$temp',
            style:TextStyle(
              fontSize:30.0
            ),
            ),
          ],
        ),
      ),
        
    );
  }
}