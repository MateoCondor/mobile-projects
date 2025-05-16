import 'package:flutter/material.dart';

class LoginController {
  String? validarUsuario(String? value) {
    if (value == null || value.isEmpty) return 'Se requiere usuario';

    return null;
  }

  //Validar clave
  String? validarClave(String? value) {
    if (value == null || value.length < 10)
      return 'Se requiere clave de 10 caracteres';

    return null;
  }

  void iniciarSesion(BuildContext context, String usuario, String clave) {
    if (usuario == 'mateo' && clave == '1234567890') {
      Navigator.pushNamed(context, '/bienvenido', arguments: usuario);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Credenciales incorrectas')));
    }

  }
}
