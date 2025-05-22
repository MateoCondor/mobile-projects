import 'package:flutter/material.dart';

class Ejercicio16 extends StatelessWidget {
  const Ejercicio16({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ejercicio 16'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          'Aquí implementen el Ejercicio 16',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
