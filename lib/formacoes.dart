import 'package:flutter/material.dart';

class FormacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formacoes'),
      ),
      body: Center(
        child: Text(
          'This is the Formacoes Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
