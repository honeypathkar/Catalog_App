import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'utils/myroute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Set HomePage as the starting page
      routes: {
        MyRoute.loginRoute: (context) => const LoginPage(),
        MyRoute.homeRoute: (context) => HomePage(),
      },
    );
  }
}
