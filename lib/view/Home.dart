import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geojson/geojson.dart';
import 'package:smart_land/view/LocationView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

getGeoJsonFile() async {
  final geo = GeoJson();
  await geo.searchInFile('assets/lokasiBogor', query: GeoJsonQuery());
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Land App'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selamat Datang ke aplikasi Smart Land'),
              SizedBox(height: 32.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationView()),
                    );
                  },
                  child: Text('Isi Lokasi'))
            ],
          ),
        ),
      ),
    );
  }
}
