import 'package:anio_bisiesto/models/anio_model.dart';

class AnioController {
  //verificar si es bisiesto
  bool verificarBisiesto(int anio) {
    return AnioModel(anio).esBisiesto();
  }

  //obtener 10 ultimos años
  List<int> obtenerUltimos(int desde) {
    List<int> lista = [];
    int actual = desde;

    while (lista.length < 10) {  // Fixed the typo here (length instead of lenght)
      if (verificarBisiesto(actual)) {
        lista.add(actual);
      }
      actual--;
    }
    return lista;
  }
}