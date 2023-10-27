import 'package:flutter/material.dart';

class NacionalidadePage extends StatelessWidget {
  const NacionalidadePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nacionalidade'),
      ),
      body: const Center(
        child: Text(
          'This is the Nacionalidade Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
