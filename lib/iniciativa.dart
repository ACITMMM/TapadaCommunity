import 'package:flutter/material.dart';

class IniciativaPage extends StatelessWidget {
  const IniciativaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciativa'),
      ),
      body: const Center(
        child: Text(
          'This is the Iniciativa Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
