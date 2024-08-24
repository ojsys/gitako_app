import 'package:flutter/material.dart';

class TrackRecordsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Farm Records'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Here you can track all farm records'),
            // You can add a list of records or buttons to view specific types of records
          ],
        ),
      ),
    );
  }
}
