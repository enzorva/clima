import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '1fc3e0ef626c6bbfe9e4195f78959a61';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  late double latitude;
  late double longitude;
  late NetworkHelper networkHelper;

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
