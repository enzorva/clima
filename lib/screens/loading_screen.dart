import 'location_screen.dart';
import '../services/networking.dart';
import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  late double latitude;
  late double longitude;
  late NetworkHelper networkHelper;

  void init() async {
    var weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    navigateToLocationScreen(weatherData);
  }

  void navigateToLocationScreen(dynamic weatherData) {
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
