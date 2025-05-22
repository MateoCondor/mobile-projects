import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../themes/app_theme.dart';
import '../themes/app_colors.dart';

class ProfileView extends StatelessWidget {
  final UserModel user;
  const ProfileView({required this.user, super.key});

  Widget _item(
    String label,
    String value,
    BuildContext context, {
    IconData? icon,
  }) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shadowColor: AppColors.cardShadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (icon != null) ...[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value.isEmpty ? 'No disponible' : value,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil')),
      body: Container(
        decoration: AppTheme.gradientBackground(),
        child: ListView(
          children: [
            // Encabezado del perfil con avatar
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      user.username.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '@${user.username}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'INFORMACIÓN PERSONAL',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            // Lista de información del perfil con iconos
            _item(
              'Usuario',
              user.username,
              context,
              icon: Icons.person_outline,
            ),
            _item(
              'Nombre completo',
              '${user.firstName} ${user.lastName}',
              context,
              icon: Icons.badge_outlined,
            ),
            _item('Email', user.email, context, icon: Icons.email_outlined),
            _item('Teléfono', user.phone, context, icon: Icons.phone_outlined),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'DIRECCIÓN',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            _item(
              'Dirección',
              user.address,
              context,
              icon: Icons.home_outlined,
            ),
            _item(
              'Ciudad',
              user.city,
              context,
              icon: Icons.location_city_outlined,
            ),
            _item(
              'Provincia',
              user.province,
              context,
              icon: Icons.map_outlined,
            ),
            _item(
              'Código Postal',
              user.postalCode,
              context,
              icon: Icons.markunread_mailbox_outlined,
            ),

            const SizedBox(height: 30),

            // Botón para editar perfil
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: AppTheme.gradientButton(),
                child: ElevatedButton(
                  onPressed: () {
                    // Acción para editar perfil
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Función de editar perfil no implementada",
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    "EDITAR PERFIL",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
