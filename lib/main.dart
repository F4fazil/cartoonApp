import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_awesome/viewmodel/cartoonview.dart';
import 'package:ui_awesome/views/homescreen.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartoonViewModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
