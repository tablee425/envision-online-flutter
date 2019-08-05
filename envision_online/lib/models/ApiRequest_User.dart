import 'package:json_annotation/json_annotation.dart';

ApiRequest_User _$ApiRequest_UserFromJson(Map<String, dynamic> json) => new ApiRequest_User(
    email: json['email'] as String,
    password: json['password'] as String,
    remember_me: json['remember_me'] as bool,
);

abstract class _$ApiRequest_UserSerializerMixin {
  String get email;
  String get password;
  bool get remember_me;

  Map<String, dynamic> toJson() => <String, dynamic> {
    'email': email,
    'password': password,
    'remember_me': remember_me,
  };
}

@JsonSerializable()
class ApiRequest_User extends Object with _$ApiRequest_UserSerializerMixin {
  String email;
  String password;
  bool remember_me;
  ApiRequest_User({this.email, this.password, this.remember_me});
  factory ApiRequest_User.fromJson(Map<String, dynamic> json) => _$ApiRequest_UserFromJson(json);
}
