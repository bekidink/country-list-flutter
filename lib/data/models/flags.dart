import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flags.freezed.dart';
part 'flags.g.dart';


@freezed
@HiveType(typeId: 1)
class Flags with _$Flags {
  const factory Flags({required String png}) = _Flags;
  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);
}
