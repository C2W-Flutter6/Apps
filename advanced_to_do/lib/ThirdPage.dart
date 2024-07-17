import 'package:flutter/material.dart';

class ToDoAppUI extends StatefulWidget {
  const ToDoAppUI({super.key});

  @override
  State<ToDoAppUI> createState() => _ToDoAppUIState();
}

class _ToDoAppUIState extends State<ToDoAppUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
