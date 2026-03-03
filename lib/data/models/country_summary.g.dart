// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_summary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountrySummaryAdapter extends TypeAdapter<CountrySummary> {
  @override
  final int typeId = 2;

  @override
  CountrySummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountrySummary(
      name: fields[0] as Name,
      flags: fields[1] as Flags,
      population: fields[2] as int,
      cca2: fields[3] as String,
      capital: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CountrySummary obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.flags)
      ..writeByte(2)
      ..write(obj.population)
      ..writeByte(3)
      ..write(obj.cca2)
      ..writeByte(4)
      ..write(obj.capital);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountrySummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountrySummaryImpl _$$CountrySummaryImplFromJson(Map<String, dynamic> json) =>
    _$CountrySummaryImpl(
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
      population: (json['population'] as num).toInt(),
      cca2: json['cca2'] as String,
      capital:
          (json['capital'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CountrySummaryImplToJson(
        _$CountrySummaryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flags': instance.flags,
      'population': instance.population,
      'cca2': instance.cca2,
      'capital': instance.capital,
    };
