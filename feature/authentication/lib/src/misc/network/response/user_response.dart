import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({required this.id, required this.name, required this.email});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  final String id;
  final String name;
  final String email;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
