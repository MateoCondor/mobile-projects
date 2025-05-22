import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../themes/app_theme.dart';
import '../themes/app_colors.dart';
import 'profile_view.dart';

class HomeView extends StatelessWidget {
  final AuthController controller;
  const HomeView({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            color: AppColors.accent,
            onPressed: () {
              // Cerrar sesión
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      body: Container(
        decoration: AppTheme.gradientBackground(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarjeta de bienvenida
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.lightAccent,
                          radius: 30,
                          child: Text(
                            controller.currentUser?.username
                                    .substring(0, 1)
                                    .toUpperCase() ??
                                'U',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "¡Hola, ${controller.currentUser?.firstName ?? 'Usuario'}!",
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              "Bienvenido de nuevo",
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.person_outline),
                      label: const Text('Ver mi perfil'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    ProfileView(user: controller.currentUser!),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Titulo de opciones
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16),
              child: Text(
                "Opciones rápidas",
                style: theme.textTheme.titleLarge,
              ),
            ),

            // Opciones en grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildOptionCard(
                    context,
                    'Configuración',
                    Icons.settings_outlined,
                    AppColors.secondary,
                  ),
                  _buildOptionCard(
                    context,
                    'Notificaciones',
                    Icons.notifications_outlined,
                    AppColors.accent,
                  ),
                  _buildOptionCard(
                    context,
                    'Mensajes',
                    Icons.message_outlined,
                    AppColors.primary,
                  ),
                  _buildOptionCard(
                    context,
                    'Ayuda',
                    Icons.help_outline_rounded,
                    AppColors.success,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          // Acción al seleccionar una opción
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Has seleccionado: $title"),
              behavior: SnackBarBehavior.floating,
              backgroundColor: color,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
