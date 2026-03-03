// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryDetails _$CountryDetailsFromJson(Map<String, dynamic> json) {
  return _CountryDetails.fromJson(json);
}

/// @nodoc
mixin _$CountryDetails {
  @HiveField(0)
  Name get name => throw _privateConstructorUsedError;
  @HiveField(1)
  Flags get flags => throw _privateConstructorUsedError;
  @HiveField(2)
  int get population => throw _privateConstructorUsedError;
  @HiveField(3)
  List<String> get capital => throw _privateConstructorUsedError;
  @HiveField(4)
  String get region => throw _privateConstructorUsedError;
  @HiveField(5)
  String get subregion => throw _privateConstructorUsedError;
  @HiveField(6)
  double get area => throw _privateConstructorUsedError;
  @HiveField(7)
  List<String> get timezones => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryDetailsCopyWith<CountryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDetailsCopyWith<$Res> {
  factory $CountryDetailsCopyWith(
          CountryDetails value, $Res Function(CountryDetails) then) =
      _$CountryDetailsCopyWithImpl<$Res, CountryDetails>;
  @useResult
  $Res call(
      {@HiveField(0) Name name,
      @HiveField(1) Flags flags,
      @HiveField(2) int population,
      @HiveField(3) List<String> capital,
      @HiveField(4) String region,
      @HiveField(5) String subregion,
      @HiveField(6) double area,
      @HiveField(7) List<String> timezones});

  $NameCopyWith<$Res> get name;
  $FlagsCopyWith<$Res> get flags;
}

/// @nodoc
class _$CountryDetailsCopyWithImpl<$Res, $Val extends CountryDetails>
    implements $CountryDetailsCopyWith<$Res> {
  _$CountryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? flags = null,
    Object? population = null,
    Object? capital = null,
    Object? region = null,
    Object? subregion = null,
    Object? area = null,
    Object? timezones = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as Flags,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as int,
      capital: null == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as List<String>,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      subregion: null == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      timezones: null == timezones
          ? _value.timezones
          : timezones // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NameCopyWith<$Res> get name {
    return $NameCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FlagsCopyWith<$Res> get flags {
    return $FlagsCopyWith<$Res>(_value.flags, (value) {
      return _then(_value.copyWith(flags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CountryDetailsImplCopyWith<$Res>
    implements $CountryDetailsCopyWith<$Res> {
  factory _$$CountryDetailsImplCopyWith(_$CountryDetailsImpl value,
          $Res Function(_$CountryDetailsImpl) then) =
      __$$CountryDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) Name name,
      @HiveField(1) Flags flags,
      @HiveField(2) int population,
      @HiveField(3) List<String> capital,
      @HiveField(4) String region,
      @HiveField(5) String subregion,
      @HiveField(6) double area,
      @HiveField(7) List<String> timezones});

  @override
  $NameCopyWith<$Res> get name;
  @override
  $FlagsCopyWith<$Res> get flags;
}

/// @nodoc
class __$$CountryDetailsImplCopyWithImpl<$Res>
    extends _$CountryDetailsCopyWithImpl<$Res, _$CountryDetailsImpl>
    implements _$$CountryDetailsImplCopyWith<$Res> {
  __$$CountryDetailsImplCopyWithImpl(
      _$CountryDetailsImpl _value, $Res Function(_$CountryDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? flags = null,
    Object? population = null,
    Object? capital = null,
    Object? region = null,
    Object? subregion = null,
    Object? area = null,
    Object? timezones = null,
  }) {
    return _then(_$CountryDetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as Flags,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as int,
      capital: null == capital
          ? _value._capital
          : capital // ignore: cast_nullable_to_non_nullable
              as List<String>,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      subregion: null == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      timezones: null == timezones
          ? _value._timezones
          : timezones // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryDetailsImpl implements _CountryDetails {
  const _$CountryDetailsImpl(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.flags,
      @HiveField(2) required this.population,
      @HiveField(3) required final List<String> capital,
      @HiveField(4) required this.region,
      @HiveField(5) required this.subregion,
      @HiveField(6) required this.area,
      @HiveField(7) required final List<String> timezones})
      : _capital = capital,
        _timezones = timezones;

  factory _$CountryDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryDetailsImplFromJson(json);

  @override
  @HiveField(0)
  final Name name;
  @override
  @HiveField(1)
  final Flags flags;
  @override
  @HiveField(2)
  final int population;
  final List<String> _capital;
  @override
  @HiveField(3)
  List<String> get capital {
    if (_capital is EqualUnmodifiableListView) return _capital;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capital);
  }

  @override
  @HiveField(4)
  final String region;
  @override
  @HiveField(5)
  final String subregion;
  @override
  @HiveField(6)
  final double area;
  final List<String> _timezones;
  @override
  @HiveField(7)
  List<String> get timezones {
    if (_timezones is EqualUnmodifiableListView) return _timezones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timezones);
  }

  @override
  String toString() {
    return 'CountryDetails(name: $name, flags: $flags, population: $population, capital: $capital, region: $region, subregion: $subregion, area: $area, timezones: $timezones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.flags, flags) || other.flags == flags) &&
            (identical(other.population, population) ||
                other.population == population) &&
            const DeepCollectionEquality().equals(other._capital, _capital) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.subregion, subregion) ||
                other.subregion == subregion) &&
            (identical(other.area, area) || other.area == area) &&
            const DeepCollectionEquality()
                .equals(other._timezones, _timezones));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      flags,
      population,
      const DeepCollectionEquality().hash(_capital),
      region,
      subregion,
      area,
      const DeepCollectionEquality().hash(_timezones));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryDetailsImplCopyWith<_$CountryDetailsImpl> get copyWith =>
      __$$CountryDetailsImplCopyWithImpl<_$CountryDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryDetailsImplToJson(
      this,
    );
  }
}

abstract class _CountryDetails implements CountryDetails {
  const factory _CountryDetails(
          {@HiveField(0) required final Name name,
          @HiveField(1) required final Flags flags,
          @HiveField(2) required final int population,
          @HiveField(3) required final List<String> capital,
          @HiveField(4) required final String region,
          @HiveField(5) required final String subregion,
          @HiveField(6) required final double area,
          @HiveField(7) required final List<String> timezones}) =
      _$CountryDetailsImpl;

  factory _CountryDetails.fromJson(Map<String, dynamic> json) =
      _$CountryDetailsImpl.fromJson;

  @override
  @HiveField(0)
  Name get name;
  @override
  @HiveField(1)
  Flags get flags;
  @override
  @HiveField(2)
  int get population;
  @override
  @HiveField(3)
  List<String> get capital;
  @override
  @HiveField(4)
  String get region;
  @override
  @HiveField(5)
  String get subregion;
  @override
  @HiveField(6)
  double get area;
  @override
  @HiveField(7)
  List<String> get timezones;
  @override
  @JsonKey(ignore: true)
  _$$CountryDetailsImplCopyWith<_$CountryDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
