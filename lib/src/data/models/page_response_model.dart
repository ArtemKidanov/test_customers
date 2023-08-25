import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_customers/src/domain/entities/user.dart';

part 'page_response_model.freezed.dart';
part 'page_response_model.g.dart';

@freezed
class PageResponseModel with _$PageResponseModel {
  factory PageResponseModel({
    required int page,
    @JsonKey(name: 'per_page') required int perPage,
    required int total,
    @JsonKey(name: 'total_pages') required int totalPages,
    required List<User> data,
  }) = _PageResponseModel;

  factory PageResponseModel.fromJson(Map<String, Object?> json) =>
      _$PageResponseModelFromJson(json);
}
