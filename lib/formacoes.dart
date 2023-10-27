import 'package:flutter/material.dart';

class FormacoesPage extends StatelessWidget {
  const FormacoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formacoes'),
      ),
      body: const Center(
        child: Text(
          'This is the Formacoes Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
