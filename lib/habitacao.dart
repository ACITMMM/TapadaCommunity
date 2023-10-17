import 'package:flutter/material.dart';

class HabitacaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habitacao'),
      ),
      body: Center(
        child: Text(
          'This is the Habitacao Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
