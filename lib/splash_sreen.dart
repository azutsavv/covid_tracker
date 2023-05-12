import 'dart:async';
import 'package:covid_tracker/world_state.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routename = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(context as BuildContext,
          MaterialPageRoute(builder: (context) => worlds_stats())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/picture/covid.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) =>
                    Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
                    )
                    ),
      
                Container(
                  alignment: Alignment.center,
                  child: const Text('Covid-19 \nTracker',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                    color: Colors.white60),
                    textAlign: TextAlign.center,),
                ),
          ],
        ),
      ),
    );
  }
}
