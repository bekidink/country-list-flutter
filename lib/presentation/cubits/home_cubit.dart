import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/data/repositories/country_repository.dart';
import 'package:countries_app/data/models/country_summary.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CountryRepository repository;
  List<CountrySummary> _allCountries = [];

  HomeCubit(this.repository) : super(HomeLoading());

  Future<void> loadCountries() async {
    emit(HomeLoading());
    try {
      _allCountries = await repository.getAllCountries();
      emit(HomeSuccess(
        countries: _allCountries,
        filtered: _allCountries,
        sortBy: 'name',
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void search(String query) {
    if (state is! HomeSuccess) return;
    final success = state as HomeSuccess;
    final filtered = query.isEmpty
        ? _allCountries
        : _allCountries
            .where((c) =>
                c.name.common.toLowerCase().contains(query.toLowerCase()))
            .toList();

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

  Future<void> toggleFavorite(String cca2) async {
    await repository.toggleFavorite(cca2);
    if (state is HomeSuccess) {
      final success = state as HomeSuccess;
      emit(HomeSuccess(
        countries: success.countries,
        filtered: success.filtered,
        sortBy: success.sortBy,
      ));
    }
  }

  Future<void> refresh() async {
    await loadCountries();
  }
}
