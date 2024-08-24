import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to your Dashboard!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_farm_staff');
              },
              child: Text('Add Farm Staff'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/track_records');
              },
              child: Text('Track Farm Records'),
            ),
            // Add more buttons for different features
          ],
        ),
      ),
    );
  }
}
