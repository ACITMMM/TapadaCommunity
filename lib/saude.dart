import 'package:flutter/material.dart';

class SaudePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saude Page'),
      ),
      body: Center(
        child: Text(
          'This is the Saude Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
