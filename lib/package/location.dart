import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  dynamic latitude = '';
  dynamic longitude = '';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('ละติจูด = ' + latitude, style: TextStyle(fontSize: 26)),
          Text('ลองติจูด = ' + longitude, style: TextStyle(fontSize: 26)),
        ],
      )),
    );
  }
}
