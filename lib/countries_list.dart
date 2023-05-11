import 'package:covid_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class countries_list extends StatefulWidget {
  static const routename = '/trackcounntries';
  const countries_list({super.key});

  @override
  State<countries_list> createState() => _countries_listState();
}

class _countries_listState extends State<countries_list> {
  TextEditingController serachcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    state_services _state_services = state_services();
    return Scaffold(
      backgroundColor:const Color.fromRGBO(25, 25, 25, 1),
      appBar: AppBar(
        backgroundColor:const Color.fromRGBO(25, 25, 25, 1),
        elevation: 0,
        ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10, top: 8, bottom: 8),
            child: TextFormField(
              
              controller: serachcontroller,
              decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
            child: Expanded(
              child: FutureBuilder(
                future: _state_services.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      children:  [
                        const Text('Data is being fetched', style: TextStyle(
                          color: Colors.white60
                        ), ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        const SpinKitFadingCircle(
                        size: 50,
                        color: Colors.white60,
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Column(
                        children: [],
                      );
                    });
                  }
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
