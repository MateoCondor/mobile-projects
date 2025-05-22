import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplos de Cálculo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Ejercicios'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EnergiaPage()),
                );
              },
              child: const Text('1. Pago por consumo de energía'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrecioArticuloPage()),
                );
              },
              child: const Text('2. Precio final de artículo'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla para cálculo de energía
class EnergiaPage extends StatefulWidget {
  const EnergiaPage({super.key});

  @override
  State<EnergiaPage> createState() => _EnergiaPageState();
}

class _EnergiaPageState extends State<EnergiaPage> {
  final TextEditingController _kwController = TextEditingController();
  double _totalEnergia = 0;
  final double precioPorKW = 0.10;

  void calcularPagoEnergia() {
    double kw = double.tryParse(_kwController.text) ?? 0;
    setState(() {
      _totalEnergia = kw * precioPorKW;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Energía'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingrese los KWH consumidos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _kwController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'KWH consumidos',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: calcularPagoEnergia,
              child: const Text('Calcular pago'),
            ),
            const SizedBox(height: 20),
            Text('Total a pagar: \$${_totalEnergia.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// Pantalla para cálculo de precio del artículo
class PrecioArticuloPage extends StatefulWidget {
  const PrecioArticuloPage({super.key});

  @override
  State<PrecioArticuloPage> createState() => _PrecioArticuloPageState();
}

class _PrecioArticuloPageState extends State<PrecioArticuloPage> {
  final TextEditingController _precioArticuloController = TextEditingController();
  double _precioConDescuento = 0;
  double _precioFinal = 0;

  void calcularPrecioArticulo() {
    double precio = double.tryParse(_precioArticuloController.text) ?? 0;
    double descuento = precio * 0.20;
    double precioConDescuento = precio - descuento;
    double iva = precioConDescuento * 0.15;
    double precioFinal = precioConDescuento + iva;

    setState(() {
      _precioConDescuento = precioConDescuento;
      _precioFinal = precioFinal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Precio de Artículo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingrese el precio del artículo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _precioArticuloController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Precio del artículo',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: calcularPrecioArticulo,
              child: const Text('Calcular precio final'),
            ),
            const SizedBox(height: 20),
            Text('Precio con 20% de descuento: \$${_precioConDescuento.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
            Text('Precio final con 15% IVA: \$${_precioFinal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
