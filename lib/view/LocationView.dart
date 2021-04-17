import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_land/view/InformationView.dart';

class LocationView extends StatefulWidget {
  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final longitudeController = new TextEditingController();
  final latitudeController = new TextEditingController();

  Future getCurrentPosition() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    Position currentPosition = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      longitudeController.text = currentPosition.longitude.toString();
      latitudeController.text = currentPosition.latitude.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Isi Lokasi'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading:
                      Image.asset('assets/images/latitude.png', height: 40),
                  title: TextFormField(
                    controller: longitudeController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Longtitude',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading:
                      Image.asset('assets/images/longitude.png', height: 40),
                  title: TextFormField(
                    controller: latitudeController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Latitude',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlineButton(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.blue,
                      style: BorderStyle.solid,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: Text('Isi Otomatis Lokasi',
                        style: TextStyle(color: Colors.blue)),
                    onPressed: () async {
                      await getCurrentPosition();
                    }),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformationView()),
                      );
                    },
                    child: Text('Cari informasi')),
              )
            ],
          ),
        ));
  }
}
