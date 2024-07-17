import 'package:flutter/material.dart';
import 'package:advanced_to_do/login_signup/login.dart';
import 'package:advanced_to_do/login_signup/register.dart';
import 'ThirdPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'home': (context) => const ToDoAppUI(),
    },
  ));
}
