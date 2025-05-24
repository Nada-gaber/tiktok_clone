import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/user_model.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated({required UserModel user}) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}