import 'package:flutter/material.dart';
import 'screens/ejercicio16.dart';
import 'screens/ejercicio17.dart';
import 'screens/ejercicio18.dart';
import 'screens/ejercicio22.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios de Navegación',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MenuPrincipal(),
      routes: {
        '/ejercicio16': (context) => const Ejercicio16(),
        '/ejercicio17': (context) => const Ejercicio17(),
      },
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Menú Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selecciona un ejercicio:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // Botón para el ejercicio 16 (usando rutas)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio16');
              },
              child: const Text('Ejercicio 16 - Routes'),
            ),
            const SizedBox(height: 15),
            // Botón para el ejercicio 17 (usando rutas)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio17');
              },
              child: const Text('Ejercicio 17 - Routes'),
            ),
            const SizedBox(height: 15),
            // Botón para el ejercicio 18 (usando push)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ejercicio18()),
                );
              },
              child: const Text('Ejercicio 18 - Push'),
            ),
            const SizedBox(height: 15),
            // Botón para el ejercicio 22 (usando push)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ejercicio22()),
                );
              },
              child: const Text('Ejercicio 22 - Push'),
            ),
          ],
        ),
      ),
    );
  }
}
