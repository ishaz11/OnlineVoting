// To parse this JSON data, do
//
//     final positions = positionsFromJson(jsonString);

import 'dart:convert';

List<Positions> positionsFromJson(String str) => List<Positions>.from(json.decode(str).map((x) => Positions.fromJson(x)));

String positionsToJson(List<Positions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Positions {
  Positions({
    this.election,
    this.positionId,
    this.electionId,
    this.positionName,
    this.count,
  });

  Election? election;
  int? positionId;
  int? electionId;
  String? positionName;
  int? count;

  factory Positions.fromJson(Map<String, dynamic> json) => Positions(
    election: Election.fromJson(json["Election"]),
    positionId: json["PositionId"],
    electionId: json["ElectionID"],
    positionName: json["PositionName"],
    count: json["Count"],
  );

  Map<String, dynamic> toJson() => {
    "Election": election?.toJson(),
    "PositionId": positionId,
    "ElectionID": electionId,
    "PositionName": positionName,
    "Count": count,
  };
}

class Election {
  Election({
    this.electionId,
    this.electionName,
    this.isActive,
  });

  int? electionId;
  String? electionName;
  bool? isActive;

  factory Election.fromJson(Map<String, dynamic> json) => Election(
    electionId: json["ElectionID"],
    electionName: json["ElectionName"],
    isActive: json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "ElectionID": electionId,
    "ElectionName": electionName,
    "IsActive": isActive,
  };
}
