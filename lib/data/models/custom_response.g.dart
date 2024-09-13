// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomResponse _$CustomResponseFromJson(Map<String, dynamic> json) =>
    CustomResponse(
      message: json['message'] as String?,
      apiCallStatus:
          $enumDecodeNullable(_$ApiCallStatusEnumMap, json['apiCallStatus']) ??
              ApiCallStatus.loading,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'],
    );

Map<String, dynamic> _$CustomResponseToJson(CustomResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'apiCallStatus': _$ApiCallStatusEnumMap[instance.apiCallStatus]!,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

const _$ApiCallStatusEnumMap = {
  ApiCallStatus.loading: 'loading',
  ApiCallStatus.success: 'success',
  ApiCallStatus.error: 'error',
  ApiCallStatus.empty: 'empty',
};
