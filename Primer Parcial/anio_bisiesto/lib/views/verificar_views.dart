import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../controllers/anio_controller.dart';

class VerificarView extends StatefulWidget {
  VerificarView({super.key});
  @override
  State<VerificarView> createState() => _VerificarViewState();
}

class _VerificarViewState extends State<VerificarView>
    with SingleTickerProviderStateMixin {
  //declaro y mapeo objetos

  TextEditingController anioC = TextEditingController();
  //instanciar

  AnioController controller = AnioController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //diseño

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Verificador de Años Bisiestos'),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE8F5FE), Color(0xFFF0EAFE)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: size.height * 0.3,
                  child: Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_ysas4vcp.json',
                    animate: true,
                    controller: _animationController,
                    errorBuilder: (context, error, stackTrace) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 80,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 16),
                          Text(
                            '¿Es Bisiesto?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      );
                    },
                    frameBuilder: (context, child, composition) {
                      if (composition == null) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return child;
                    },
                  ),
                ),
                SizedBox(height: 30),
                Card(
                  elevation: 8,
                  shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '¿Es bisiesto?',
                          style: Theme.of(context).textTheme.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Introduce un año para comprobar si es bisiesto',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24),
                        TextField(
                          controller: anioC,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Año",
                            hintText: "Ej: 2024",
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton.icon(
                          onPressed: () => _verificarAnio(context),
                          icon: Icon(Icons.search, size: 24),
                          label: Text("VERIFICAR AHORA"),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "Un año es bisiesto si es divisible por 4, excepto aquellos divisibles por 100 pero no por 400.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _verificarAnio(BuildContext context) {
    int anio;
    try {
      anio = int.parse(anioC.text);
    } catch (_) {
      _mostrarError(context, "Año no válido");
      return;
    }
    final esBisiesto = controller.verificarBisiesto(anio);
    if (!esBisiesto) {
      _mostrarError(context, "El año $anio no es bisiesto");
      return;
    }
    Navigator.pushNamed(context, '/resultado', arguments: {'anio': anio});
  }

  void _mostrarError(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            SizedBox(width: 10),
            Text(mensaje),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
