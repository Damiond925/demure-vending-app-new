import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'services/inventory_service.dart';
void main() {
  runApp(const DemureApp());
}

class DemureApp extends StatelessWidget {
  const DemureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEMURE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // You can modify this later.
        scaffoldBackgroundColor: Color(0xFFF5F5F5), // Calm, elegant background.
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF607D8B), // Soft bold bar color.
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
      },
    );
  }
}