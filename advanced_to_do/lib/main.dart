import 'package:flutter/material.dart';
import 'package:advanced_to_do/login_signup/login.dart';
import 'package:advanced_to_do/login_signup/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}
