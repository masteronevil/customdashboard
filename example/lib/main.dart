import 'package:flutter/material.dart';
import 'package:customdashboard/customdashboard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Customdashboard(
           appBar: AppBar(title: const Text('Example App')),
           body: const Center(child: Text('Hello, Custom Dashboard!')),
           sideBar: const Drawer(),
         ),
    );
  }
}
