import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'themes/app_themes.dart';
import 'views/verificar_views.dart';
import 'views/resultado_views.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Año Bisiesto',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => VerificarView(),
        '/resultado': (context) => ResultadoView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
