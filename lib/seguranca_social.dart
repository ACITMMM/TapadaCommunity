import 'package:flutter/material.dart';

class SegurancaSocialPage extends StatelessWidget {
  const SegurancaSocialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segurança Social'),
      ),
      body: const Center(
        child: Text(
          'This is the Segurança Social Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
