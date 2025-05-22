import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../themes/app_theme.dart';
import '../themes/app_colors.dart';

class LoginView extends StatefulWidget {
  final AuthController controller;
  const LoginView({required this.controller, super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // Aplicamos el gradiente de fondo
      body: Container(
        decoration: AppTheme.gradientBackground(),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Logo o icono con un contenedor con sombra circular
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.lock_outline_rounded,
                    size: 60,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 30),

                // Título de la aplicación
                Text("Bienvenido", style: theme.textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(
                  "Inicia sesión para continuar",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 30),

                // Campo de usuario con sombra
                Container(
                  decoration: BoxDecoration(
                    color: theme.inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _username,
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: theme.colorScheme.secondary,
                      ),
                      hintText: 'Usuario',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo de contraseña con sombra
                Container(
                  decoration: BoxDecoration(
                    color: theme.inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: theme.colorScheme.secondary,
                      ),
                      hintText: 'Contraseña',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                // Opciones de recordar y olvidar contraseña
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (v) => setState(() => rememberMe = v!),
                          activeColor: AppColors.primary,
                        ),
                        Text("Recordarme", style: theme.textTheme.bodySmall),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primary,
                      ),
                      child: Text(
                        "¿Olvidaste la contraseña?",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Botón de inicio de sesión con gradiente
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: AppTheme.gradientButton(),
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.controller.login(
                        _username.text,
                        _password.text,
                      )) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        // Mostrar SnackBar en caso de error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Usuario o contraseña incorrectos"),
                            backgroundColor: AppColors.error,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      disabledForegroundColor: Colors.white.withOpacity(0.5),
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Separador con texto
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "O continuar con",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Botones de redes sociales
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(Icons.g_mobiledata_rounded, Colors.red),
                    const SizedBox(width: 16),
                    _socialButton(Icons.apple, Colors.black),
                    const SizedBox(width: 16),
                    _socialButton(Icons.facebook, Colors.blue),
                  ],
                ),

                const SizedBox(height: 30),

                // Enlace para crear cuenta
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿No tienes cuenta? ",
                      style: theme.textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Regístrate ahora",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para crear botones de redes sociales
  Widget _socialButton(IconData icon, Color color) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 30),
        color: color,
        onPressed: () {},
      ),
    );
  }
}
