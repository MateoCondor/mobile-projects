import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'controllers/auth_controller.dart';
import 'themes/app_theme.dart';
import 'themes/app_colors.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';
import 'views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Establecer color de la barra de estado
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Establecer orientación preferida
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController controller = AuthController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginView(controller: controller),
        '/home': (context) => HomeView(controller: controller),
        '/register': (context) => RegisterView(controller: controller),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
