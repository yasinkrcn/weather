import 'dart:convert';

class ResponseModel {
  final bool status;
  final String responseCode;
  final String message;

  ResponseModel({
    required this.status,
    required this.responseCode,
    required this.message,
  });

  factory ResponseModel.fromJson(String str) => ResponseModel.fromMap(json.decode(str));

  factory ResponseModel.fromMap(Map<String, dynamic> json) => ResponseModel(
        status: json["status"] ?? false,
        responseCode: json["response_code"] ?? "",
        message: json["message"] ?? "",
      );
}
