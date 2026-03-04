import 'package:freezed_annotation/freezed_annotation.dart';

import 'name.dart';
import 'flags.dart';

part 'country_details.freezed.dart';
part 'country_details.g.dart';

@freezed

class CountryDetails with _$CountryDetails {
  const factory CountryDetails({
    required Name name,
    required Flags flags,
    required int population,
    required List<String> capital,
    required String region,
    required String subregion,
    required double area,
    required List<String> timezones,
  }) = _CountryDetails;

  factory CountryDetails.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsFromJson(json);
}
