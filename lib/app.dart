import 'package:drink_calculator/src/home_screen.dart';
import 'package:flutter/material.dart';

class DrinkCalculatorApp extends StatelessWidget {
  const DrinkCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalulator alkoholowy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Kalulator alkoholowy'),
      debugShowCheckedModeBanner: false,
    );
  }
}