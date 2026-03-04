import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/data/repositories/country_repository.dart';
import 'package:countries_app/data/models/country_summary.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CountryRepository repository;
  List<CountrySummary> _allCountries = [];
  String _currentQuery = '';

  HomeCubit(this.repository) : super(HomeLoading());

  Future<void> loadCountries() async {
    emit(HomeLoading());
    try {
      _allCountries = await repository.getAllCountries();
      emit(HomeSuccess(
        countries: _allCountries,
        filtered: _allCountries,
        sortBy: 'name',
        selectedContinent: null,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void search(String query) {
    _currentQuery = query.toLowerCase();
    if (state is! HomeSuccess) return;
    final success = state as HomeSuccess;

    var filtered = success.countries;
    if (success.selectedContinent != null) {
      filtered =
          filtered.where((c) => c.region == success.selectedContinent).toList();
    }

    if (_currentQuery.isNotEmpty) {
      filtered = filtered
          .where((c) => c.name.common.toLowerCase().contains(_currentQuery))
          .toList();
    }

    emit(success.copyWith(filtered: filtered));
  }

  void sort(String by) {
    if (state is! HomeSuccess) return;
    final success = state as HomeSuccess;
    final sorted = List<CountrySummary>.from(success.filtered);
    if (by == 'name') {
      sorted.sort((a, b) => a.name.common.compareTo(b.name.common));
    } else {
      sorted.sort((a, b) => b.population.compareTo(a.population));
    }
    emit(success.copyWith(filtered: sorted, sortBy: by));
  }

  void filterByContinent(String? continent) {
    if (state is! HomeSuccess) return;
    final success = state as HomeSuccess;

    var filtered = continent == null
        ? success.countries
        : success.countries.where((c) => c.region == continent).toList();

    if (_currentQuery.isNotEmpty) {
      filtered = filtered
          .where((c) => c.name.common.toLowerCase().contains(_currentQuery))
          .toList();
    }

    emit(success.copyWith(filtered: filtered, selectedContinent: continent));
  }

  Future<void> toggleFavorite(String cca2) async {
    await repository.toggleFavorite(cca2);
    // Re-apply current filters
    if (state is HomeSuccess) {
      final success = state as HomeSuccess;
      search(_currentQuery); // refresh filtered list
    }
  }

  Future<void> refresh() async {
    await loadCountries();
    search(_currentQuery);
  }
}
