import 'package:covid_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'models/world_status.dart';

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
    state_services _state_services = state_services();
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
                  FutureBuilder(
                      future: _state_services.fetchworldstaterecords(),
                      builder: (context, AsyncSnapshot<WorldStatus> snapshot) {
                        if (!snapshot.hasData) {
                          return Expanded(
                              flex: 1,
                              child: SpinKitFadingCircle(
                                color: Colors.white,
                                size: 50,
                                controller: _controller,
                              ));
                        } else {
                          return Column(
                            children: [
                              PieChart(
                                  legendOptions: const LegendOptions(
                                      legendTextStyle: TextStyle(
                                    color: Colors.white70,
                                  )),
                                  centerTextStyle:
                                      const TextStyle(color: Colors.white70),
                                  chartType: ChartType.ring,
                                  chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true,
                                  ),
                                  animationDuration:
                                      const Duration(milliseconds: 1200),
                                  dataMap: {
                                    "Total": double.parse(
                                        snapshot.data!.cases!.toString()),
                                    "Recovered": double.parse(
                                        snapshot.data!.recovered!.toString()),
                                    "Active": double.parse(
                                        snapshot.data!.active!.toString()),
                                  }),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Card(
                                  color: Colors.grey.shade800,
                                  child: Column(
                                    children: [
                                      reuasble_row(
                                        title: 'Total',
                                        value: snapshot.data!.cases!.toString(),
                                      ),
                                      reuasble_row(
                                          title: "Active",
                                          value: snapshot.data!.active!
                                              .toString()),
                                      reuasble_row(
                                          title: "Recovered",
                                          value: snapshot.data!.recovered!
                                              .toString()),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, 'trackcountries'),
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
                style: const TextStyle(color: Colors.white70),
              ),
              Text(
                value,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
