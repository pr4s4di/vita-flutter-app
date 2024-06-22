import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String email;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  final String nickname;
  @JsonKey(name: "birth_date")
  final DateTime birthDate;
  final String token;

  const User(this.email, this.firstName, this.lastName, this.nickname,
      this.birthDate, this.token);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props =>
      [email, firstName, lastName, nickname, birthDate, token];
}
