import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/country_code_bloc.dart';
import '../bloc/country_code_event.dart';
import '../bloc/country_code_state.dart';
import '../constants/strings.dart';

class CountryCodeDropDownView extends StatefulWidget {
  const CountryCodeDropDownView([Key? key]) : super(key: key);

  @override
  State<CountryCodeDropDownView> createState() => _CountryCodeDropDownState();
}

class _CountryCodeDropDownState extends State<CountryCodeDropDownView> {
  @override
  void initState() {
    super.initState();
    context.read<CountryCodeBloc>().add(LoadCountryCodes());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCodeBloc, CountryCodeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: state.selectedCode,
              hint: Text(Strings.hintCountry),
              items:
                  state.filteredCodes.map((country) {
                    return DropdownMenuItem<String>(
                      value: country.id.toString(),
                      child: Text(country.value),
                    );
                  }).toList(),
              onChanged: (value) {
                context.read<CountryCodeBloc>().add(
                  CountrySelectedEvent(value ?? ''),
                );
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: state.selectedStateCountry.isNotEmpty,
              child: DropdownButtonFormField<String>(
                value: state.selectedStateCode,
                hint: Text(Strings.hintState),
                items:
                    state.selectedStateCountry.map((country) {
                      return DropdownMenuItem<String>(
                        value: country.value,
                        child: Text(country.value),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    });
                },
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        );
      },
    );
  }
}
