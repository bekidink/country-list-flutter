import 'dart:convert';

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

    // Safe cache read (no forced cast)
    final dynamic cached = _cacheBox.get(cacheKey);
    if (cached is String && cached.isNotEmpty) {
      try {
        final List<dynamic> decoded = jsonDecode(cached);
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
        '/all?fields=name,flags,population,cca2,capital,region', // ← region added
      );

      final list = (res.data as List<dynamic>)
          .map((json) => CountrySummary.fromJson(json as Map<String, dynamic>))
          .toList();

      // Cache safely as JSON string
      await _cacheBox.put(
        cacheKey,
        jsonEncode(list.map((e) => e.toJson()).toList()),
      );

      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future<CountryDetails> getCountryDetails(String cca2) async {
    final key = 'detail_$cca2';

    // Safe cache read
    final dynamic cached = _cacheBox.get(key);
    if (cached is String && cached.isNotEmpty) {
      try {
        final decoded = jsonDecode(cached);
        return CountryDetails.fromJson(decoded as Map<String, dynamic>);
      } catch (_) {}
    }

    try {
      final res = await _dio.get(
        '/alpha/$cca2?fields=name,flags,population,capital,region,subregion,area,timezones',
      );

      // 🔥 THIS IS THE FIX
      final Map<String, dynamic> rawData;
      if (res.data is List && (res.data as List).isNotEmpty) {
        rawData = (res.data as List).first as Map<String, dynamic>;
      } else if (res.data is Map<String, dynamic>) {
        rawData = res.data as Map<String, dynamic>;
      } else {
        throw Exception('Unexpected API response format');
      }

      final details = CountryDetails.fromJson(rawData);

      await _cacheBox.put(key, jsonEncode(details.toJson()));
      return details;
    } catch (e) {
      rethrow;
    }
  }
  List<String> getFavoriteIds() => _favoritesBox.values.toList();

  Future<void> toggleFavorite(String cca2) async {
    if (_favoritesBox.containsKey(cca2)) {
      await _favoritesBox.delete(cca2);
    } else {
      await _favoritesBox.put(cca2, cca2);
    }
  }
}
