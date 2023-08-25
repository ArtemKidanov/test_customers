// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PageResponseModel _$$_PageResponseModelFromJson(Map<String, dynamic> json) =>
    _$_PageResponseModel(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PageResponseModelToJson(
        _$_PageResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };
