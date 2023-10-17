import 'package:flutter/material.dart';

class NacionalidadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nacionalidade'),
      ),
      body: Center(
        child: Text(
          'This is the Nacionalidade Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
