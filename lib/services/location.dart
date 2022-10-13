import 'package:geolocator/geolocator.dart';
class Location{
  double latitude;
  double longitude;
 Future<void> GetLocation() async {
    try {
      LocationPermission permission = await Geolocator
          .requestPermission(); //optional thing
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      longitude=position.longitude;
      latitude=position.latitude;
    }
    catch(e){
      print(e);
    }
  }

}