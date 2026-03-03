import 'dart:convert'; // ← add this

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/country_summary.dart';
import '../models/country_details.dart';

class CountryRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://restcountries.com/v3.1'));
  final Box _cacheBox = Hive.box('cache');
  final Box<String> _favoritesBox = Hive.box<String>('favorites');

  Future<List<CountrySummary>> getAllCountries() async {
    const cacheKey = 'countries';

    // Try cache first
    final cachedJson = _cacheBox.get(cacheKey) as String?;
    if (cachedJson != null) {
      try {
        final List<dynamic> decoded = jsonDecode(cachedJson);
        return decoded
            .map(
                (json) => CountrySummary.fromJson(json as Map<String, dynamic>))
            .toList();
      } catch (_) {
        // corrupted cache → fetch fresh
      }
    }

    try {
      final res = await _dio.get(
        '/all?fields=name,flags,population,cca2,capital',
      );

      final list = (res.data as List<dynamic>)
          .map((json) => CountrySummary.fromJson(json as Map<String, dynamic>))
          .toList();

      // Cache as JSON string
      await _cacheBox.put(
          cacheKey, jsonEncode(list.map((e) => e.toJson()).toList()));

      return list;
    } catch (e) {
      rethrow; // let cubit show error/retry
    }
  }

  Future<CountryDetails> getCountryDetails(String cca2) async {
    final key = 'detail_$cca2';

    final cachedJson = _cacheBox.get(key) as String?;
    if (cachedJson != null) {
      try {
        return CountryDetails.fromJson(
            jsonDecode(cachedJson) as Map<String, dynamic>);
      } catch (_) {}
    }

    try {
      final res = await _dio.get(
        '/alpha/$cca2?fields=name,flags,population,capital,region,subregion,area,timezones',
      );

      final raw = (res.data as List<dynamic>).first as Map<String, dynamic>;
      final details = CountryDetails.fromJson(raw);

      // Cache as JSON string
      await _cacheBox.put(key, jsonEncode(details.toJson()));

      return details;
    } catch (e) {
      rethrow;
    }
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
