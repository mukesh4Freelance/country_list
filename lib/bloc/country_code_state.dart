import '../model/country_model.dart';
import '../model/state_model.dart';

class CountryCodeState {
  final List<CountryModel> countryCodes;
  final List<StateModel> selectedStateCountry;
  final List<CountryModel> filteredCodes;
  final String selectedCode;
  final String selectedStateCode;

  CountryCodeState({
    required this.countryCodes,
    required this.selectedStateCountry,
    required this.filteredCodes,
    required this.selectedCode,
    required this.selectedStateCode,
  });

  CountryCodeState copyWith({
    List<CountryModel>? countryCodes,
    List<StateModel>? selectedStateCountry,
    List<CountryModel>? filteredCodes,
    String? selectedCode,
    String? selectedStateCode,
  }) {
    return CountryCodeState(
      countryCodes: countryCodes ?? this.countryCodes,
      selectedStateCountry: selectedStateCountry ?? this.selectedStateCountry,
      filteredCodes: filteredCodes ?? this.filteredCodes,
      selectedCode: selectedCode ?? this.selectedCode,
      selectedStateCode: selectedStateCode ?? this.selectedStateCode,
    );
  }
}