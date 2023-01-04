import 'package:flutter/material.dart';
import 'package:utcapp/screen/index.dart';
import 'package:utcapp/screen/login.dart';
import 'package:utcapp/screen/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Index(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
      },
    );
  }
}
