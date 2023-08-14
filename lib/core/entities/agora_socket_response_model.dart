import 'dart:convert';

class AgoraSocketResponseModel {
  String? channelId;

  String? token;
  int? myUid;
  int? targetId;

  AgoraSocketResponseModel({
    this.channelId = "",
    this.token = "",
    this.myUid,
    this.targetId = 0,
  });

  factory AgoraSocketResponseModel.fromJson(String str) => AgoraSocketResponseModel.fromMap(json.decode(str));

  factory AgoraSocketResponseModel.fromMap(Map<String, dynamic> json) => AgoraSocketResponseModel(
        channelId: json["channelId"] ?? "",
        token: json["token"] ?? "",
        myUid: json["myUid"] ?? "",
        targetId: json["opponentId"] ?? 0,
      );
}
