import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../models/user_model.dart';
import '../themes/app_theme.dart';
import '../themes/app_colors.dart';

class RegisterView extends StatefulWidget {
  final AuthController controller;
  const RegisterView({required this.controller, super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _data = <String, String>{};
  bool agreeTerms = false;
  bool showPassword = false;

  Widget _buildField(
    String label,
    String key, {
    bool obscure = false,
    IconData? prefixIcon,
  }) {
    final theme = Theme.of(context);
    return Container(
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
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        obscureText: obscure && !showPassword,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: label,
          hintStyle: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.textLight,
          ),
          prefixIcon:
              prefixIcon != null
                  ? Icon(prefixIcon, color: theme.colorScheme.secondary)
                  : null,
          suffixIcon:
              obscure
                  ? IconButton(
                    icon: Icon(
                      showPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: theme.colorScheme.secondary,
                    ),
                    onPressed:
                        () => setState(() => showPassword = !showPassword),
                  )
                  : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
        ),
        validator:
            (value) =>
                value == null || value.isEmpty ? 'Campo requerido' : null,
        onSaved: (value) => _data[key] = value ?? '',
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate() && agreeTerms) {
      _formKey.currentState!.save();
      final user = UserModel(
        username: _data['username']!,
        password: _data['password']!,
        firstName: _data['firstName']!,
        lastName: _data['lastName']!,
        city: '',
        province: '',
        address: '',
        email: _data['email']!,
        phone: '',
        postalCode: '',
      );
      widget.controller.register(user);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.primary,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Registro"),
      ),
      body: Container(
        decoration: AppTheme.gradientBackground(),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado con texto descriptivo
                  Text(
                    "Crear una cuenta",
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Completa tu información para registrarte",
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 30),

                  // Campos de formulario con iconos
                  _buildField(
                    "Nombre",
                    "firstName",
                    prefixIcon: Icons.person_outline,
                  ),
                  _buildField(
                    "Apellido",
                    "lastName",
                    prefixIcon: Icons.people_outline,
                  ),
                  _buildField(
                    "Nombre de usuario",
                    "username",
                    prefixIcon: Icons.account_circle_outlined,
                  ),
                  _buildField(
                    "Correo electrónico",
                    "email",
                    prefixIcon: Icons.email_outlined,
                  ),
                  _buildField(
                    "Contraseña",
                    "password",
                    obscure: true,
                    prefixIcon: Icons.lock_outline_rounded,
                  ),
                  // Términos y condiciones con estilo mejorado
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Checkbox(
                          value: agreeTerms,
                          onChanged: (v) => setState(() => agreeTerms = v!),
                          activeColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Text("Acepto los ", style: theme.textTheme.bodySmall),
                        GestureDetector(
                          onTap: () {
                            // Mostrar términos y condiciones
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: Text(
                                      'Términos y condiciones',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    content: const SingleChildScrollView(
                                      child: Text(
                                        'Al registrarse, usted acepta nuestros términos de servicio y política de privacidad.',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          'Aceptar',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            );
                          },
                          child: Text(
                            "términos y condiciones",
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Botón de registro con gradiente
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: AppTheme.gradientButton(),
                    child: ElevatedButton(
                      onPressed: agreeTerms ? _submit : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        disabledForegroundColor: Colors.white.withOpacity(0.5),
                        shadowColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: const Text(
                        "REGISTRARSE",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
