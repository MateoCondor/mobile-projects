import 'dart:async';

import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import '../themes/text_styles.dart';
import '../themes/color_schemes.dart';
import '../themes/text_styles.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final claveController = TextEditingController();

  final controller = LoginController();
  bool recordarCheck = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: usuarioController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                  validator: controller.validarUsuario,
                ),
                TextFormField(
                  controller: claveController,
                  decoration: const InputDecoration(labelText: 'Clave'),
                  obscureText: true,
                  validator: controller.validarClave,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: recordarCheck,
                      onChanged: (value) {
                        setState(() {
                          recordarCheck = value!;
                        });
                      },
                    ),
                    const Text('Recordar usuario y clave'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.iniciarSesion(context, usuarioController.text, claveController.text);
                    }
                  },
                  child: const Text('Iniciar Sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
