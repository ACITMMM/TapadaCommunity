import 'package:flutter/material.dart';

class SaudePage extends StatelessWidget {
  const SaudePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saude Page'),
      ),
      body: const Center(
        child: Text(
          'This is the Saude Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
