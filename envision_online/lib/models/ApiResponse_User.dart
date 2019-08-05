//import 'User.dart';
//import 'package:json_annotation/json_annotation.dart';
//
//ApiResponse_User _$ApiResponse_UserFromJson(Map<String, dynamic> json) => new ApiResponse_User(
//    success: json['success'] as bool,
//    user: json['user'] == null
//        ? null
//        : new User.fromJson(json['user'] as Map<String, dynamic>));
//
//abstract class _$ApiResponse_UserSerializerMixin {
//  bool get success;
//  User get user;
//
//  Map<String, dynamic> toJson() => <String, dynamic>{'success': success, 'user': user};
//}
//
//@JsonSerializable()
//class ApiResponse_User extends Object with _$ApiResponse_UserSerializerMixin {
//  bool success;
//  User user;
//
//  ApiResponse_User({this.success, this.user});
//
//  factory ApiResponse_User.fromJson(Map<String, dynamic> json) => _$ApiResponse_UserFromJson(json);
//}

import 'User.dart';
import 'package:json_annotation/json_annotation.dart';

ApiResponse_User _$ApiResponse_UserFromJson(Map<String, dynamic> json) => new ApiResponse_User(
    success: json['success'] as bool,
    name: json['name'] as String,
    token: json['token'] as String,
    user_id: json['user_id'] as int,
);

abstract class _$ApiResponse_UserSerializerMixin {
  bool get success;
  String get name;
  String get token;
  int get user_id;

  Map<String, dynamic> toJson() => <String, dynamic>{'success': success, 'name': name, 'token': token, 'user_id': user_id};
}

@JsonSerializable()
class ApiResponse_User extends Object with _$ApiResponse_UserSerializerMixin {
  bool success;
  String name;
  String token;
  int user_id;

  ApiResponse_User({this.success, this.name, this.token, this.user_id});

  factory ApiResponse_User.fromJson(Map<String, dynamic> json) => _$ApiResponse_UserFromJson(json);
}
