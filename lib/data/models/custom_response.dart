import 'package:json_annotation/json_annotation.dart';
import 'package:starter_template_get_x/data/data.dart';

part 'custom_response.g.dart';

@JsonSerializable()
class CustomResponse {
  String? message;
  @JsonKey(defaultValue: ApiCallStatus.loading)
  ApiCallStatus apiCallStatus;
  int? statusCode;
  dynamic data;

  // TODO: Add field for count

  CustomResponse({
    this.message,
    this.apiCallStatus = ApiCallStatus.loading,
    this.statusCode,
    this.data,
  });

  factory CustomResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResponseToJson(this);
}
