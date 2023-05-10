import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pie_chart/pie_chart.dart';

class worlds_stats extends StatefulWidget {
  static const routename = '/worlds_stats';
  const worlds_stats({super.key});

  @override
  State<worlds_stats> createState() => _worlds_statsState();
}

class _worlds_statsState extends State<worlds_stats>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(25, 25, 25, 1),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const PieChart(
                      // centerTextStyle: TextStyle(
                      //   color: Colors.white,
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      animationDuration: Duration(milliseconds: 1500),
                      dataMap: {
                        "Total": 20,
                        "Recovered": 15,
                        "Active": 5,
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      color: Colors.grey.shade800,
                      child: Column(
                        children: [
                          reuasble_row(title: 'Total', value: '200'),
                          reuasble_row(title: 'Total', value: '200'),
                          reuasble_row(title: 'Total', value: '200'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text('Track Countries'),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}

class reuasble_row extends StatelessWidget {
  String title, value;
  reuasble_row({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
