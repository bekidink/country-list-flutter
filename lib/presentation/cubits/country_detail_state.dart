part of 'country_detail_cubit.dart';

abstract class CountryDetailState {}

class CountryDetailLoading extends CountryDetailState {}

class CountryDetailError extends CountryDetailState {
  final String message;
  CountryDetailError(this.message);
}

class CountryDetailSuccess extends CountryDetailState {
  final CountryDetails details;
  CountryDetailSuccess(this.details);
}
