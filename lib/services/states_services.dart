import 'dart:convert';

import 'package:covid_tracker/models/world_status.dart';
import 'package:covid_tracker/services/utilities/app_url.dart';
import 'package:covid_tracker/world_state.dart';
import 'package:http/http.dart' as http;

class state_services {
  Future<WorldStatus> fetchworldstaterecords() async {
    final response = await http.get(Uri.parse(App_url.worldstatusApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatus.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(App_url.countriesApi));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
