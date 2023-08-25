import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_customers/src/domain/entities/user.dart';

part 'user_response_model.freezed.dart';
part 'user_response_model.g.dart';

@freezed
class UserResponseModel with _$UserResponseModel {
  factory UserResponseModel({
    required User data,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(Map<String, Object?> json) =>
      _$UserResponseModelFromJson(json);
}
