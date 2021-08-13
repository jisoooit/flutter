import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async{
    try{
       Position position = await Geolocator.
    getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    }catch(e){
      print('there was a problem with the internet connection');
    }
   
  }

  void fetchData() async{
    http.Response response=await http.get('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    if(response.statusCode==200){
      String jsonData=response.body;
      var myjson=jsonDecode(jsonData)['weather'][0]['description'];
      print(myjson);

      var wind=jsonDecode(jsonData)['wind']['speed'];
      print(wind);

      var id=jsonDecode(jsonData)['id'];
      print(id);
    }
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: Text('get my location',
          style: TextStyle(
            color: Colors.white,
            ),
          ),
          color: Colors.blue,
          
        ),

      ),
    );
  }
}