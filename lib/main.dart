import 'package:flutter/material.dart';
import 'package:my_waifu_flutter/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "ComicNeue",
        primarySwatch: Colors.green
      ),
      home: const WelcomeScreen(),
    );
  }
}
