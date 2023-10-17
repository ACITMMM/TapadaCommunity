import 'package:flutter/material.dart';

class FinancasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financas'),
      ),
      body: Center(
        child: Text(
          'This is the Financas Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
