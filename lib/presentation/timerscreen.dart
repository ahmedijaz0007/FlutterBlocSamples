
import 'package:flutter/material.dart';

class MyTimerPage extends StatefulWidget {
  const MyTimerPage({super.key, required this.title});


  final String title;

  @override
  State<MyTimerPage> createState() => _MyTimerPageState();
}

class _MyTimerPageState extends State<MyTimerPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ,
      ),
    );
  }
}