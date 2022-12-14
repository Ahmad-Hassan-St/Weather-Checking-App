import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  void initState(){
    super.initState();
    Getlocation();

   }

void Getlocation ()async{

    WeatherModel weatherModel= WeatherModel();
    var weatherdata= await weatherModel.GetWeatherData();
    Navigator.push(
      this.context,
      MaterialPageRoute(builder: (context) =>  LocationScreen(weatherdata)),
    );
  }
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ) ,
      ),
    );
  }
}
