import 'package:covid_tracker/splash_sreen.dart';
import 'package:covid_tracker/world_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'world': (context) => worlds_stats(),
      },
    );
  }
}

