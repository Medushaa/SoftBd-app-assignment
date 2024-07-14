import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Status bar color of phone
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoftBd Assignment',
      theme: new ThemeData(
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF)
      ),
      home: MyHomePage(),
    );
  }
}


