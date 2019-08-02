import 'package:json_annotation/json_annotation.dart';

User _$UserFromJson(Map<String, dynamic> json) => new User(
  name: json['name'] as String,
  token: json['token'] as String,
  user_id: json['user_id'] as int,
);

abstract class _$UserSerializerMixin {
  String get name;
  String get token;
  int get user_id;

  Map<String, dynamic> toJson() => <String, dynamic> {
    'name': name,
    'token': token,
    'user_id': user_id,
  };
}

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  String name;
  String token;
  int user_id;

  User({this.name, this.token, this.user_id});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}