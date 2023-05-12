import 'package:covid_tracker/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class details_screen extends StatefulWidget {
  String name;
  String image;
  int totalcases, totalRecoverd, active, critical, todayRecoeved, test;
  details_screen({
    required this.name,
    required this.image,
    required this.totalcases,
    required this.totalRecoverd,
    required this.active,
    required this.critical,
    required this.todayRecoeved,
    required this.test,
     });

  @override
  State<details_screen> createState() => _details_screenState();
}

class _details_screenState extends State<details_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 25, 25, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 25, 25, 1),
        title: Text(widget.name, style: const TextStyle(color: Colors.white70),),
        centerTitle: true,
      ),

      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                child: Card(
                  color: Colors.grey.shade800,
                  child: Column(
                    children: [
                      SizedBox(height:MediaQuery.of(context).size.height * 0.05 ,),
                      reuasble_row(title: 'Cases', value: widget.totalcases.toString(),),
                      reuasble_row(title: 'Recovered', value: widget.totalRecoverd.toString(),),
                      reuasble_row(title: 'Active', value: widget.active.toString(),),
                      reuasble_row(title: 'Critical', value: widget.critical.toString(),),
                      reuasble_row(title: 'Today Recovered', value: widget.todayRecoeved.toString(),),
                      reuasble_row(title: 'Test', value: widget.test.toString(),),
                      
                       ],
                  ),
                ),
              ),
              CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(widget.image),
                    )
            ],
          )
        ],
      ),
    );
  }
}
