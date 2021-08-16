import 'package:geolocator/geolocator.dart';

class Mylocation{
  double latitude2=0;
  double longitude2=0;

  Future<void> getMyCurrentLocation() async{
    try{
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2=position.latitude;
      longitude2=position.longitude;
      print(position);
      print(latitude2);
      print(longitude2);
    }catch(e){
      print('there was a problem with the internet connection');
    }
  }
}