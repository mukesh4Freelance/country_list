import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_list/service/api_service.dart';

import '../model/country_model.dart';
import '../model/state_model.dart';
import 'country_code_event.dart';
import 'country_code_state.dart';

class CountryCodeBloc extends Bloc<CountryCodeEvent, CountryCodeState> {
  CountryCodeBloc()
    : super(
        CountryCodeState(
          countryCodes: [],
          selectedStateCountry: [],
          filteredCodes: [],
          selectedCode: "",
          selectedStateCode: "",
        ),
      ) {
    final ApiService apiRepository = ApiService();
    on<LoadCountryCodes>((event, emit) async {
      //call fetch country code here....
      final List<CountryModel> countries =  await apiRepository.fetchCountries();
      emit(state.copyWith(countryCodes: countries, filteredCodes: countries, selectedCode: countries[0].id.toString()));
      add(CountrySelectedEvent(countries[0].id.toString()));
    });

    on<CountrySelectedEvent>((event, emit) async {
      final List<StateModel> statesByCountry =  await apiRepository.fetchStates(int.parse(event.country));

      emit(
        state.copyWith(
          selectedStateCountry: statesByCountry,
          selectedCode: event.country,
          selectedStateCode:
              statesByCountry.isNotEmpty
                  ? statesByCountry[0].value
                  : '',
        ),
      );
    });

    on<SearchCountryCode>((event, emit) {
      //
    });
  }
}
