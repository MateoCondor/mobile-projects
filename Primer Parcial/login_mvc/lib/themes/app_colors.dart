import 'package:flutter/material.dart';

class AppColors {
  // Colores primarios y vibrantes
  static const primary = Color(0xFF7C4DFF); // Púrpura vibrante
  static const secondary = Color(0xFF00C7B7); // Turquesa moderno
  static const accent = Color(0xFFFF7043); // Coral energético
  static const lightAccent = Color(0xFFB388FF); // Lavanda claro

  // Colores de fondo y estructura
  static const background = Color(0xFFF9FAFF); // Blanco azulado muy suave
  static const card = Color(0xFFFFFFFF); // Blanco puro
  static const cardShadow = Color(0x1A000000); // Sombra sutil

  // Colores de texto
  static const text = Color(0xFF2D3748); // Gris azulado oscuro
  static const textLight = Color(
    0xFF718096,
  ); // Gris medio para textos secundarios

  // Feedback y estados
  static const error = Color(0xFFFF5252); // Rojo vibrante
  static const success = Color(0xFF4CAF50); // Verde brillante
  static const warning = Color(0xFFFFB300); // Ámbar

  // Gradientes
  static const List<Color> primaryGradient = [
    Color(0xFF7C4DFF), // Púrpura vibrante
    Color(0xFFB388FF), // Lavanda claro
  ];

  static const List<Color> accentGradient = [
    Color(0xFFFF7043), // Coral energético
    Color(0xFFFFAB91), // Melocotón claro
  ];

  static const List<Color> backgroundGradient = [
    Color(0xFFF9FAFF), // Blanco azulado muy suave
    Color(0xFFF0F4FF), // Azul clarísimo
  ];
}
