import 'package:country_list/ui/country_code_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/country_code_bloc.dart';
import 'constants/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryCodeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(Strings.appBarTitle)),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: CountryCodeDropDownView(),
          ),
        ),
      ),
    );
  }
}
