import 'package:freezed_annotation/freezed_annotation.dart';
import 'name.dart';
import 'flags.dart';

part 'country_summary.freezed.dart';
part 'country_summary.g.dart';

@freezed
class CountrySummary with _$CountrySummary {
  const factory CountrySummary({
    required Name name,
    required Flags flags,
    required int population,
    required String cca2,
    List<String>? capital,
  }) = _CountrySummary;

  factory CountrySummary.fromJson(Map<String, dynamic> json) =>
      _$CountrySummaryFromJson(json);
}
