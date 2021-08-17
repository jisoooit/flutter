import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/data/network.dart';
import 'package:weather/data/mylocation.dart';
import 'package:weather/screens/weatherscreen.dart';

const apiKey = '6fec830b749ff5fcbf0980a4d0f5a5c0';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3 = 0;
  double longitude3 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Mylocation myLocation = Mylocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apiKey');
    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirData: airData,
      );
    }));
  }

  // void fetchData() async{

  //     var myjson=parsingData['weather'][0]['description'];
  //     print(myjson);

  //     var wind=parsingData['wind']['speed'];
  //     print(wind);

  //     var id=parsingData['id'];
  //     print(id);
  //   }else{
  //     print(response.statusCode);
  //   }
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: null,
          child: Text(
            'get my location',
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
