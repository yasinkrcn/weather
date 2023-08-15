import 'dart:convert';

class ResponseModel {
  final String? cod;
  final int? message;
  final int? cnt;

  ResponseModel({
    this.cod,
    this.message,
    this.cnt,
  });

  factory ResponseModel.fromJson(String str) => ResponseModel.fromMap(json.decode(str));

  factory ResponseModel.fromMap(Map<String, dynamic> json) => ResponseModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
      );
}
