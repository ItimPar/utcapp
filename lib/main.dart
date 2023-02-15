import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:utcapp/package/video.dart';
import 'package:utcapp/package/images.dart';
import 'package:utcapp/package/location.dart';
import 'package:utcapp/screen/dashboard.dart';
import 'package:utcapp/screen/index.dart';
import 'package:utcapp/screen/login.dart';
import 'package:utcapp/screen/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) => const Dashboard(),
        '/video': (context) => const Video(),
        '/image': (context) => const Images(),
        '/location': (context) => const Location(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/dashboard': (context) => const Dashboard(),
      },
    );
  }
}
