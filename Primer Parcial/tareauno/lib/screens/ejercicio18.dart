import 'package:flutter/material.dart';

class Ejercicio18 extends StatefulWidget {
  const Ejercicio18({super.key});

  @override
  State<Ejercicio18> createState() => _Ejercicio18State();
}

class _Ejercicio18State extends State<Ejercicio18> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  bool _mostrarResultado = false;
  String _resultado = '';
  List<int> _divisoresNum1 = [];
  List<int> _divisoresNum2 = [];
  int _sumaNum1 = 0;
  int _sumaNum2 = 0;

  @override
  void dispose() {
    print("dispose()");
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
  
  @override
  void deactivate() {
    print("deactivate()");
    super.deactivate();
  }

  // Función para encontrar los divisores propios de un número
  List<int> _encontrarDivisoresPropios(int numero) {
    List<int> divisores = [1]; // 1 siempre es divisor propio

    for (int i = 2; i <= numero ~/ 2; i++) {
      if (numero % i == 0) {
        divisores.add(i);
      }
    }

    return divisores;
  }

  // Función para sumar una lista de números
  int _sumarLista(List<int> lista) {
    return lista.fold(0, (suma, elemento) => suma + elemento);
  }

  // Verificar si dos números son amigos
  void _verificarNumerosAmigos() {
    setState(() {
      try {
        // Convertir los textos a enteros
        int num1 = int.parse(_num1Controller.text);
        int num2 = int.parse(_num2Controller.text);

        // Validar que sean enteros positivos
        if (num1 <= 0 || num2 <= 0) {
          _resultado = 'Ambos números deben ser enteros positivos.';
          _mostrarResultado = true;
          _limpiarDatos();
          return;
        }

        // Encontrar divisores propios
        _divisoresNum1 = _encontrarDivisoresPropios(num1);
        _divisoresNum2 = _encontrarDivisoresPropios(num2);

        // Sumar divisores
        _sumaNum1 = _sumarLista(_divisoresNum1);
        _sumaNum2 = _sumarLista(_divisoresNum2);

        // Verificar si son amigos
        if (_sumaNum1 == num2 && _sumaNum2 == num1) {
          _resultado = '¡Los números $num1 y $num2 SON AMIGOS! 😊❤️🫂';
        } else {
          _resultado = 'Los números $num1 y $num2 NO son amigos. 💀🔪🩸';
        }

        _mostrarResultado = true;
      } catch (e) {
        _resultado = 'Por favor, ingresa números enteros válidos.';
        _mostrarResultado = true;
        _limpiarDatos();
      }
    });
  }

  void _limpiarDatos() {
    _divisoresNum1 = [];
    _divisoresNum2 = [];
    _sumaNum1 = 0;
    _sumaNum2 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ejercicio 18 - Números Amigos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Verificar Números Amigos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Dos números son amigos si la suma de los divisores propios de uno es igual al otro número y viceversa.',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primer número',
                hintText: 'Ej. 220',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                hintText: 'Ej. 284',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _verificarNumerosAmigos,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Verificar si son amigos',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            if (_mostrarResultado) ...[
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color:
                      _sumaNum1 == int.tryParse(_num2Controller.text) &&
                              _sumaNum2 == int.tryParse(_num1Controller.text)
                          ? Colors.green.shade100
                          : const Color.fromARGB(255, 255, 178, 178),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        _sumaNum1 == int.tryParse(_num2Controller.text) &&
                                _sumaNum2 == int.tryParse(_num1Controller.text)
                            ? Colors.green
                            : const Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
                child: Text(
                  _resultado,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (_divisoresNum1.isNotEmpty && _divisoresNum2.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text(
                  'Detalle del cálculo:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildDivisoresCard(
                  int.tryParse(_num1Controller.text) ?? 0,
                  _divisoresNum1,
                  _sumaNum1,
                ),
                const SizedBox(height: 10),
                _buildDivisoresCard(
                  int.tryParse(_num2Controller.text) ?? 0,
                  _divisoresNum2,
                  _sumaNum2,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDivisoresCard(int numero, List<int> divisores, int suma) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Divisores propios de $numero:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(divisores.join(', ')),
            const SizedBox(height: 10),
            Text(
              'Suma: $suma',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}