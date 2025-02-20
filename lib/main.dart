import 'package:coffe_shop/screen/home.dart';
import 'package:coffe_shop/screen/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
      theme: ThemeData(colorSchemeSeed: Color(0xFFC67C4E)),
    );
  }
}
