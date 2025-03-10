import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../constants/strings.dart';
import '../model/country_model.dart';
import '../model/state_model.dart';

class ApiService {
  // Fetch countries
  Future<List<CountryModel>> fetchCountries() async {
    final response = await http.get(
      Uri.parse("${Constants.baseURL}/countries"),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      // Decode the JSON response
      List<dynamic> jsonList = json.decode(response.body);
      // Map the JSON objects to CountryModel instances
      List<CountryModel> countries =
          jsonList.map((jsonItem) => CountryModel.fromJson(jsonItem)).toList();
      return countries;
    } else {
      throw Exception(Strings.failLoadCountry);
    }
  }

  // Fetch states by country ID
  Future<List<StateModel>> fetchStates(int countryId) async {
    final response = await http.get(
      Uri.parse("${Constants.baseURL}/countries/$countryId/states"),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      // Map the JSON objects to StateModel instances
      List<StateModel> states =
          jsonList.map((jsonItem) => StateModel.fromJson(jsonItem)).toList();
      return states;
    } else {
      throw Exception(Strings.failLoadStates);
    }
  }
}