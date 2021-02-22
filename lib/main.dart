import 'package:flutter/material.dart';
import 'package:transformation_animation/animations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        primaryColor: Color(0xff145C9E),
        primarySwatch: Colors.blue,
        accentColor: Color(0xff007EF4),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimationPage(),
    );
  }
}
