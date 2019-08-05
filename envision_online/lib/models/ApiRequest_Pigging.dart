import 'package:json_annotation/json_annotation.dart';

ApiRequest_Pigging _$ApiRequest_PiggingFromJson(Map<String, dynamic> json) => new ApiRequest_Pigging(
  field_id: json['field_id'] as int,
  operator: json['operator'] as String,
  year: json['year'] as int,
  month: json['month'] as int,
  view: json['view'] as int,
);

abstract class _$ApiRequest_PiggingSerializerMixin {
  int get field_id;
  String get operator;
  int get year;
  int get month;
  int get view;

  Map<String, dynamic> toJson() => <String, dynamic> {
    'field_id': field_id,
    'operator': operator,
    'year': year,
    'month': month,
    'view': view,
  };
}

@JsonSerializable()
class ApiRequest_Pigging extends Object with _$ApiRequest_PiggingSerializerMixin {
  int field_id;
  String operator;
  int year;
  int month;
  int view;

  ApiRequest_Pigging({this.field_id, this.operator, this.year, this.month, this.view});
  factory ApiRequest_Pigging.fromJson(Map<String, dynamic> json) => _$ApiRequest_PiggingFromJson(json);
}
