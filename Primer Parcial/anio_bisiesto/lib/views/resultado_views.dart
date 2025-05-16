import 'package:flutter/material.dart';

import '../controllers/anio_controller.dart';

class ResultadoView extends StatelessWidget {
  final controller = AnioController();
  ResultadoView({super.key});
  @override
  Widget build(BuildContext context) {
    final orientacion = MediaQuery.of(context).orientation;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final desde = args['anio'] as int;
    final lista = controller.obtenerUltimos(desde);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Años Bisiestos'),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFE8F0FF), Color(0xFFDFE9FF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '${desde} es un año bisiesto',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Próximos años bisiestos:',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child:
                    orientacion == Orientation.portrait
                        ? _buildListView(context, lista)
                        : _buildGridView(context, lista),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        label: Text('Verificar otro año'),
        icon: Icon(Icons.arrow_back),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildListView(BuildContext context, List<int> lista) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final anio = lista[index];
        final randomHue = (anio % 360).toDouble();
        final color = HSLColor.fromAHSL(1.0, randomHue, 0.6, 0.85).toColor();
        return Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Card(
            elevation: 4,
            shadowColor: color.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: color.withOpacity(0.3), width: 1),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(
                  Icons.calendar_today,
                  color: color.withOpacity(0.8),
                ),
              ),
              title: Text(
                'Año $anio',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
              subtitle: Text(
                'Año bisiesto',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              trailing: Icon(Icons.check_circle, color: Colors.green, size: 28),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridView(BuildContext context, List<int> lista) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final anio = lista[index];
        final randomHue = (anio % 360).toDouble();
        final color = HSLColor.fromAHSL(1.0, randomHue, 0.6, 0.9).toColor();
        return Card(
          elevation: 4,
          shadowColor: color.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: color.withOpacity(0.3), width: 1),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.1), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today, color: color, size: 32),
                SizedBox(height: 8),
                Text(
                  '$anio',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  'Año bisiesto',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
