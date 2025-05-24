import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String uid;
  final String email;
  final String displayName;
  final String? photoURL;

  const UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoURL,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [uid, email, displayName, photoURL];
}