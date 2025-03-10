
class CountryCodeEvent {}

class LoadCountryCodes extends CountryCodeEvent {}

class SearchCountryCode extends CountryCodeEvent {
  final String query;
  SearchCountryCode(this.query);
}
class CountrySelectedEvent extends CountryCodeEvent {
  final String country;
  CountrySelectedEvent(this.country);
}
