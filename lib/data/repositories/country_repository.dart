import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/country_summary.dart';
import '../models/country_details.dart';

class CountryRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://restcountries.com/v3.1'));
  final Box _cacheBox = Hive.box('cache');
  final Box<String> _favoritesBox = Hive.box<String>('favorites');

  Future<List<CountrySummary>> getAllCountries() async {
    if (_cacheBox.containsKey('countries')) {
      final list = (_cacheBox.get('countries') as List)
          .map((e) => CountrySummary.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    }

    final res = await _dio.get(
      '/all?fields=name,flags,population,cca2,capital',
    );
    final list = (res.data as List)
        .map((json) => CountrySummary.fromJson(json))
        .toList();

    await _cacheBox.put('countries', list.map((e) => e.toJson()).toList());
    return list;
  }

  Future<CountryDetails> getCountryDetails(String cca2) async {
    final key = 'detail_$cca2';
    if (_cacheBox.containsKey(key)) {
      return CountryDetails.fromJson(
          _cacheBox.get(key) as Map<String, dynamic>);
    }

    final res = await _dio.get(
        '/alpha/$cca2?fields=name,flags,population,capital,region,subregion,area,timezones');
    final details = CountryDetails.fromJson(res.data[0]);
    await _cacheBox.put(key, details.toJson());
    return details;
  }

  List<String> getFavoriteIds() => _favoritesBox.values.toList();

  Future<void> toggleFavorite(String cca2) async {
    if (_favoritesBox.values.contains(cca2)) {
      await _favoritesBox.delete(cca2);
    } else {
      await _favoritesBox.put(cca2, cca2);
    }
  }
}
