import 'package:flutter/material.dart';
import 'package:timerbloc/presentation/timerscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const MyTimerPage(title: 'Flutter Timer App'),
    );
  }
}

