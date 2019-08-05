import 'package:json_annotation/json_annotation.dart';

Area _$AreaFromJson(Map<String, dynamic> json) => new Area(
  id: json['id'] as int,
  company_id: json['company_id'] as int,
  name: json['name'] as String,
);

abstract class _$AreaSerializerMixin {
  int get id;
  int get company_id;
  String get name;

  Map<String, dynamic> toJson() => <String, dynamic> {
    'id': id,
    'company_id': company_id,
    'name': name,
  };
}

@JsonSerializable()
class Area extends Object with _$AreaSerializerMixin {
  int id;
  int company_id;
  String name;

  Area({this.id, this.company_id, this.name});
  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
}
