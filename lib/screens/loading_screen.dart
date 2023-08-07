import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    const url =
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=1fc3e0ef626c6bbfe9e4195f78959a61';

    var encoded = Uri.parse(url);

    Response response = await get(encoded);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold();
  }
}
