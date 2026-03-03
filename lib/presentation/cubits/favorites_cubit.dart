import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/data/repositories/country_repository.dart';
import 'package:countries_app/data/models/country_summary.dart';
import 'home_cubit.dart';
import 'package:countries_app/core/di/injection.dart';
class FavoritesCubit extends Cubit<List<CountrySummary>> {
  final CountryRepository repository;
 late final HomeCubit homeCubit;

  FavoritesCubit(this.repository) : super([]) {
    homeCubit = getIt<HomeCubit>(); // already registered
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final ids = repository.getFavoriteIds();
    final all = await repository.getAllCountries();
    final favs = all.where((c) => ids.contains(c.cca2)).toList();
    emit(favs);
  }

  Future<void> toggle(String cca2) async {
    await repository.toggleFavorite(cca2);
    await _loadFavorites();
  }
}
