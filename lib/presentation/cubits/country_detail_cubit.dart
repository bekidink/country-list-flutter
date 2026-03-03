import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/data/repositories/country_repository.dart';
import 'package:countries_app/data/models/country_details.dart';

part 'country_detail_state.dart';

class CountryDetailCubit extends Cubit<CountryDetailState> {
  final CountryRepository repository;
  final String cca2;

  CountryDetailCubit(this.repository, this.cca2)
      : super(CountryDetailLoading());

  Future<void> load() async {
    emit(CountryDetailLoading());
    try {
      final details = await repository.getCountryDetails(cca2);
      emit(CountryDetailSuccess(details));
    } catch (e) {
      emit(CountryDetailError(e.toString()));
    }
  }
}
