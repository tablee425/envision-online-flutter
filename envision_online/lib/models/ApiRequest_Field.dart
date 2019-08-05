import 'package:json_annotation/json_annotation.dart';

ApiRequest_Field _$ApiRequest_FieldFromJson(Map<String, dynamic> json) => new ApiRequest_Field(
  area_id: json['area_id'] as int,
);

abstract class _$ApiRequest_FieldSerializerMixin {
  int get area_id;

  Map<String, dynamic> toJson() => <String, dynamic> {
    'area_id': area_id,
  };
}

@JsonSerializable()
class ApiRequest_Field extends Object with _$ApiRequest_FieldSerializerMixin {
  int area_id;

  ApiRequest_Field({this.area_id});
  factory ApiRequest_Field.fromJson(Map<String, dynamic> json) => _$ApiRequest_FieldFromJson(json);
}
