import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Catalog App"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: const Text("Welcome to Catalog App"),
        ),
      ),
      endDrawer: const Drawer(),
    );
  }
}
