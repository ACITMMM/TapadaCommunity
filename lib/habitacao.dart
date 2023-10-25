import 'package:flutter/material.dart';

class HabitacaoPage extends StatelessWidget {
  const HabitacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habitacao'),
      ),
      body: const Center(
        child: Text(
          'This is the Habitacao Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
