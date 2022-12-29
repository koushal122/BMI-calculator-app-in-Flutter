import 'package:flutter/material.dart';
import 'input_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF111736),
        appBarTheme: AppBarTheme(
          color: Color(0xFF090F1E)
        )
      ),
      home: SafeArea(
        child: InputPage(),
      ),
    );
  }
}
