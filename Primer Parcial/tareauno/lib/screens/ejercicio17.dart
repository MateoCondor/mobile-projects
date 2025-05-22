import 'package:flutter/material.dart';

class Ejercicio17 extends StatelessWidget {
  const Ejercicio17({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ejercicio 17'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          'Aquí implementen el Ejercicio 17',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
