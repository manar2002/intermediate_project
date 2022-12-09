import 'package:flutter/material.dart';
import 'package:nodaliza_store/constants.dart';
import 'package:nodaliza_store/views/splash/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashView(),
      theme: theme,
      title: 'Nodaliza Store',
      builder: (context, child) => SafeArea(child: child!),
      debugShowCheckedModeBanner: false,
    );
  }
}