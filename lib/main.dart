import 'package:flutter/material.dart';
import 'package:x_youtube/screen/hompage.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.black),
      ),
      home: Hompage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
