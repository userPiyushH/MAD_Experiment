
import 'package:chatapp/login.dart';
import 'package:chatapp/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'Login',
    routes: {
      'Login': (context) => const MyLogin(),
      'Register' : (context)  => const MyRegister(),
    },
  ));
}
