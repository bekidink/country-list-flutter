// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryDetailsAdapter extends TypeAdapter<CountryDetails> {
  @override
  final int typeId = 3;

  @override
  CountryDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryDetails(
      name: fields[0] as Name,
      flags: fields[1] as Flags,
      population: fields[2] as int,
      capital: (fields[3] as List).cast<String>(),
      region: fields[4] as String,
      subregion: fields[5] as String,
      area: fields[6] as double,
      timezones: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CountryDetails obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.flags)
      ..writeByte(2)
      ..write(obj.population)
      ..writeByte(3)
      ..write(obj.capital)
      ..writeByte(4)
      ..write(obj.region)
      ..writeByte(5)
      ..write(obj.subregion)
      ..writeByte(6)
      ..write(obj.area)
      ..writeByte(7)
      ..write(obj.timezones);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryDetailsImpl _$$CountryDetailsImplFromJson(Map<String, dynamic> json) =>
    _$CountryDetailsImpl(
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
      population: (json['population'] as num).toInt(),
      capital:
          (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
      region: json['region'] as String,
      subregion: json['subregion'] as String,
      area: (json['area'] as num).toDouble(),
      timezones:
          (json['timezones'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CountryDetailsImplToJson(
        _$CountryDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flags': instance.flags,
      'population': instance.population,
      'capital': instance.capital,
      'region': instance.region,
      'subregion': instance.subregion,
      'area': instance.area,
      'timezones': instance.timezones,
    };
