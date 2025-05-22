import 'package:flutter/material.dart';

class Ejercicio22 extends StatefulWidget {
  const Ejercicio22({super.key});

  @override
  State<Ejercicio22> createState() => _Ejercicio22State();
}

class _Ejercicio22State extends State<Ejercicio22> {
  final TextEditingController _nController = TextEditingController();
  final List<TextEditingController> _xControllers = [];
  bool _mostrarResultado = false;
  String _resultado = '';
  List<String> _terminos = [];
  double _valorTotal = 0;
  int _numTerminos = 0;

  @override
  void dispose() {
    print("dispose()");
    _nController.dispose();
    for (var controller in _xControllers) {
      controller.dispose();
    }
    super.dispose();
  }
  
  @override
  void deactivate() {
    print("deactivate()");
    super.deactivate();
  }

  // Función para calcular el factorial de un número
  int _calcularFactorial(int n) {
    if (n <= 1) return 1;
    return n * _calcularFactorial(n - 1);
  }

  // Función para generar los campos de entrada para x₁, x₂, ..., xₙ
  void _generarCamposX() {
    setState(() {
      try {
        // Limpiar resultados anteriores
        _mostrarResultado = false;
        
        // Obtener el número de términos
        _numTerminos = int.parse(_nController.text);
        
        // Validar que n sea un entero positivo
        if (_numTerminos <= 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Por favor, ingresa un valor de n positivo')),
          );
          return;
        }

        // Limpiar controladores anteriores
        for (var controller in _xControllers) {
          controller.dispose();
        }
        _xControllers.clear();
        
        // Crear nuevos controladores
        for (int i = 0; i <= _numTerminos; i++) {
          _xControllers.add(TextEditingController());
        }
        
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingresa un valor de n válido')),
        );
      }
    });
  }

  // Función para calcular la serie
  void _calcularSerie() {
    setState(() {
      try {
        _terminos = [];
        double suma = 1.0; // El primer término siempre es 1
        _terminos.add('Término 0: 1');
        
        // Calcular cada término de la serie
        for (int i = 1; i <= _numTerminos; i++) {
          double valorX = double.parse(_xControllers[i].text);
          int factorial = _calcularFactorial(i);
          double termino = valorX / factorial;
          suma += termino;
          
          // Guardar el término para mostrarlo
          _terminos.add('Término $i: (x₍$i₎/$i!) = ($valorX/$factorial) = ${termino.toStringAsFixed(6)}');
        }
        
        _valorTotal = suma;
        _resultado = 'El valor de la serie es: ${_valorTotal.toStringAsFixed(6)}';
        _mostrarResultado = true;
      } catch (e) {
        _resultado = 'Error: Asegúrate de ingresar valores numéricos válidos en todos los campos.';
        _mostrarResultado = true;
        _terminos = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ejercicio 22 - Serie Matemática'),
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
              'Cálculo de Serie Matemática',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            
            const SizedBox(height: 30),
            TextField(
              controller: _nController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número de términos (n)',
                hintText: 'Ingresa un entero positivo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _generarCamposX,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Generar campos para valores de x'),
            ),
            const SizedBox(height: 20),
            
            // Campos dinámicos para los valores de x
            if (_xControllers.isNotEmpty) ...[
              const Divider(),
              const Text(
                'Ingresa los valores para cada x:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              
              // Campo para x₁, x₂, etc.
              for (int i = 1; i <= _numTerminos; i++) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextField(
                    controller: _xControllers[i],
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Valor de x$i',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularSerie,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Calcular valor de la serie',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
            
            // Resultados
            if (_mostrarResultado) ...[
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
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
              if (_terminos.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text(
                  'Desarrollo paso a paso:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _terminos.map((termino) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(termino),
                      )).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  color: Colors.green.shade50,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        const Text(
                          'Suma total: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          _valorTotal.toStringAsFixed(6),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}