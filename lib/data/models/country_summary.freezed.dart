// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountrySummary _$CountrySummaryFromJson(Map<String, dynamic> json) {
  return _CountrySummary.fromJson(json);
}

/// @nodoc
mixin _$CountrySummary {
  @HiveField(0)
  Name get name => throw _privateConstructorUsedError;
  @HiveField(1)
  Flags get flags => throw _privateConstructorUsedError;
  @HiveField(2)
  int get population => throw _privateConstructorUsedError;
  @HiveField(3)
  String get cca2 => throw _privateConstructorUsedError;
  @HiveField(4)
  List<String>? get capital => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountrySummaryCopyWith<CountrySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountrySummaryCopyWith<$Res> {
  factory $CountrySummaryCopyWith(
          CountrySummary value, $Res Function(CountrySummary) then) =
      _$CountrySummaryCopyWithImpl<$Res, CountrySummary>;
  @useResult
  $Res call(
      {@HiveField(0) Name name,
      @HiveField(1) Flags flags,
      @HiveField(2) int population,
      @HiveField(3) String cca2,
      @HiveField(4) List<String>? capital});

  $NameCopyWith<$Res> get name;
  $FlagsCopyWith<$Res> get flags;
}

/// @nodoc
class _$CountrySummaryCopyWithImpl<$Res, $Val extends CountrySummary>
    implements $CountrySummaryCopyWith<$Res> {
  _$CountrySummaryCopyWithImpl(this._value, this._then);

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
    Object? cca2 = null,
    Object? capital = freezed,
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
      cca2: null == cca2
          ? _value.cca2
          : cca2 // ignore: cast_nullable_to_non_nullable
              as String,
      capital: freezed == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
abstract class _$$CountrySummaryImplCopyWith<$Res>
    implements $CountrySummaryCopyWith<$Res> {
  factory _$$CountrySummaryImplCopyWith(_$CountrySummaryImpl value,
          $Res Function(_$CountrySummaryImpl) then) =
      __$$CountrySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) Name name,
      @HiveField(1) Flags flags,
      @HiveField(2) int population,
      @HiveField(3) String cca2,
      @HiveField(4) List<String>? capital});

  @override
  $NameCopyWith<$Res> get name;
  @override
  $FlagsCopyWith<$Res> get flags;
}

/// @nodoc
class __$$CountrySummaryImplCopyWithImpl<$Res>
    extends _$CountrySummaryCopyWithImpl<$Res, _$CountrySummaryImpl>
    implements _$$CountrySummaryImplCopyWith<$Res> {
  __$$CountrySummaryImplCopyWithImpl(
      _$CountrySummaryImpl _value, $Res Function(_$CountrySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? flags = null,
    Object? population = null,
    Object? cca2 = null,
    Object? capital = freezed,
  }) {
    return _then(_$CountrySummaryImpl(
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
      cca2: null == cca2
          ? _value.cca2
          : cca2 // ignore: cast_nullable_to_non_nullable
              as String,
      capital: freezed == capital
          ? _value._capital
          : capital // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountrySummaryImpl implements _CountrySummary {
  const _$CountrySummaryImpl(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.flags,
      @HiveField(2) required this.population,
      @HiveField(3) required this.cca2,
      @HiveField(4) final List<String>? capital})
      : _capital = capital;

  factory _$CountrySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountrySummaryImplFromJson(json);

  @override
  @HiveField(0)
  final Name name;
  @override
  @HiveField(1)
  final Flags flags;
  @override
  @HiveField(2)
  final int population;
  @override
  @HiveField(3)
  final String cca2;
  final List<String>? _capital;
  @override
  @HiveField(4)
  List<String>? get capital {
    final value = _capital;
    if (value == null) return null;
    if (_capital is EqualUnmodifiableListView) return _capital;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CountrySummary(name: $name, flags: $flags, population: $population, cca2: $cca2, capital: $capital)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountrySummaryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.flags, flags) || other.flags == flags) &&
            (identical(other.population, population) ||
                other.population == population) &&
            (identical(other.cca2, cca2) || other.cca2 == cca2) &&
            const DeepCollectionEquality().equals(other._capital, _capital));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, flags, population, cca2,
      const DeepCollectionEquality().hash(_capital));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountrySummaryImplCopyWith<_$CountrySummaryImpl> get copyWith =>
      __$$CountrySummaryImplCopyWithImpl<_$CountrySummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountrySummaryImplToJson(
      this,
    );
  }
}

abstract class _CountrySummary implements CountrySummary {
  const factory _CountrySummary(
      {@HiveField(0) required final Name name,
      @HiveField(1) required final Flags flags,
      @HiveField(2) required final int population,
      @HiveField(3) required final String cca2,
      @HiveField(4) final List<String>? capital}) = _$CountrySummaryImpl;

  factory _CountrySummary.fromJson(Map<String, dynamic> json) =
      _$CountrySummaryImpl.fromJson;

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
  String get cca2;
  @override
  @HiveField(4)
  List<String>? get capital;
  @override
  @JsonKey(ignore: true)
  _$$CountrySummaryImplCopyWith<_$CountrySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
