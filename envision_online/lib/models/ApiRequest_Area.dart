import 'package:json_annotation/json_annotation.dart';

ApiRequest_Area _$ApiRequest_AreaFromJson(Map<String, dynamic> json) => new ApiRequest_Area(
  company_id: json['company_id'] as int,
  user_id: json['user_id'] as int,
);

abstract class _$ApiRequest_AreaSerializerMixin {
  int get company_id;
  int get user_id;

  Map<String, dynamic> toJson() => <String, dynamic> {
    'company_id': company_id,
    'user_id': user_id,
  };
}

@JsonSerializable()
class ApiRequest_Area extends Object with _$ApiRequest_AreaSerializerMixin {
  int company_id;
  int user_id;

  ApiRequest_Area({this.company_id, this.user_id});
  factory ApiRequest_Area.fromJson(Map<String, dynamic> json) => _$ApiRequest_AreaFromJson(json);
}
