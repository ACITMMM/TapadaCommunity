import 'package:flutter/material.dart';

class FinancasPage extends StatelessWidget {
  const FinancasPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financas'),
      ),
      body: const Center(
        child: Text(
          'This is the Financas Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
