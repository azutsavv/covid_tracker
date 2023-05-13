import 'package:covid_tracker/details_screen.dart';
import 'package:covid_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(25, 25, 25, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(25, 25, 25, 1),
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
                onChanged: (value){
                  setState(() {
                    
                  });
                },
                decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Expanded(
              child: FutureBuilder(
                future: _state_services.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      children: [
                        const Text(
                          'Data is being fetched',
                          style: TextStyle(color: Colors.white60),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const SpinKitFadingCircle(
                          size: 50,
                          color: Colors.white60,
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (serachcontroller.text.isEmpty) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                     MaterialPageRoute(builder:(context) => 
                                     details_screen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]["countryInfo"]["flag"],
                                        totalcases: snapshot.data![index]["cases"],
                                        totalRecoverd: snapshot.data![index]["recovered"],
                                        active: snapshot.data![index]["active"],
                                        critical: snapshot.data![index]["critical"],
                                        todayRecoeved: snapshot.data![index]["todayRecovered"],
                                        test: snapshot.data![index]["tests"],
                                      ),
                                      )
                                      );
                                  },
                                  child: ListTile(
                                    
                                    subtitle: Text(
                                        snapshot.data![index]["cases"].toString(),
                                        style:
                                            const TextStyle(color: Colors.white70)),
                                    title: Text(snapshot.data![index]['country'],
                                        style:
                                            const TextStyle(color: Colors.white70)),
                                    leading: Image(
                                      // fit: BoxFit.fill,
                                       width: MediaQuery.of(context).size.width * 0.2,
                                        //height: 50,
                                        image: NetworkImage(snapshot.data![index]
                                            ["countryInfo"]["flag"])),
                                  ),
                                ),
                              ],
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(serachcontroller.text.toLowerCase())) {
                            return InkWell(
                              onTap: () {
                                    Navigator.push(context,
                                     MaterialPageRoute(builder:(context) =>
                                    details_screen(
                                        name: snapshot.data![index]['country'],
                                        image: snapshot.data![index]["countryInfo"]["flag"],
                                        totalcases: snapshot.data![index]["cases"],
                                        totalRecoverd: snapshot.data![index]["recovered"],
                                        active: snapshot.data![index]["active"],
                                        critical: snapshot.data![index]["critical"],
                                        todayRecoeved: snapshot.data![index]["todayRecovered"],
                                        test: snapshot.data![index]["tests"],
                                      ),
                                     )
                                     );
                                  },
                              child: Column(
                                children: [
                                  ListTile(
                                    
                                    subtitle: Text(
                                        snapshot.data![index]["cases"].toString(),
                                        style:
                                            const TextStyle(color: Colors.white70)),
                                    title: Text(snapshot.data![index]['country'],
                                        style:
                                            const TextStyle(color: Colors.white70)),
                                    leading: Image(
                                      // fit: BoxFit.fill,
                                       width: MediaQuery.of(context).size.width * 0.2,
                                        //height: 50,
                                        image: NetworkImage(snapshot.data![index]
                                            ["countryInfo"]["flag"])),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            );
                          } else {
                            return Container(
                          
                            );
                          }
                        });
                  }
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
