import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/login_page.dart';
import 'pages/home_page.dart';

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
      initialRoute: "/home",
      routes: {
        // ignore: prefer_const_constructors
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        // ignore: prefer_const_constructors
        "/login": (context) => LoginPage(),
      },
    );
  }
}
