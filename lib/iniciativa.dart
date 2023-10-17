import 'package:flutter/material.dart';

class IniciativaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciativa'),
      ),
      body: Center(
        child: Text(
          'This is the Iniciativa Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
