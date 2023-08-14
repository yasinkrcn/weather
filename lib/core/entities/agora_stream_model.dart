import 'dart:convert';

class AgoraStreamModel {
  final bool? status;
  final String? responseCode;
  final String? message;
  final AgoraStreamInformations? data;

  AgoraStreamModel({
    this.status,
    this.responseCode,
    this.message,
    this.data,
  });

  factory AgoraStreamModel.fromJson(String str) => AgoraStreamModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AgoraStreamModel.fromMap(Map<String, dynamic> json) => AgoraStreamModel(
        status: json["status"],
        responseCode: json["response_code"],
        message: json["message"],
        data: json["data"] == null ? null : AgoraStreamInformations.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "response_code": responseCode,
        "message": message,
        "data": data?.toMap(),
      };
}

class AgoraStreamInformations {
  final String? channelName;
  final String? uid;
  final int? role;
  final String? token;

  AgoraStreamInformations({
    this.channelName,
    this.uid,
    this.role,
    this.token,
  });

  factory AgoraStreamInformations.fromJson(String str) => AgoraStreamInformations.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AgoraStreamInformations.fromMap(Map<String, dynamic> json) => AgoraStreamInformations(
        channelName: json["channelName"] ?? "",
        uid: json["uid"] ?? "",
        role: json["role"] ?? "",
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "channelName": channelName,
        "uid": uid,
        "role": role,
        "token": token,
      };
}
