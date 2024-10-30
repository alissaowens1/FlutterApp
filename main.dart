/*Exam 4 
CIS 295 Moblie Application Development (310), Fall 2024
Alissa Owens 
By submitting the exam, I swear and affirm that I alone have completed the Exam. */


import 'package:flutter/material.dart';
import 'package:exam04_alissa_owens/calculator_view.dart';

void main() {
 runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown)),
      home: const CalculatorView()
    );
  }
}