// To parse this JSON data, do
//
//     final candidates = candidatesFromJson(jsonString);

import 'dart:convert';

List<Candidates> candidatesFromJson(String str) => List<Candidates>.from(json.decode(str).map((x) => Candidates.fromJson(x)));

String candidatesToJson(List<Candidates> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Candidates {
  Candidates({
    this.candidateId,
    this.studentId,
    this.firstName,
    this.lastName,
    this.partyListName,
  });

  int? candidateId;
  int? studentId;
  String? firstName;
  String? lastName;
  String? partyListName;

  factory Candidates.fromJson(Map<String, dynamic> json) => Candidates(
    candidateId: json["CandidateID"],
    studentId: json["StudentID"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    partyListName: json["PartyListName"],
  );

  Map<String, dynamic> toJson() => {
    "CandidateID": candidateId,
    "StudentID": studentId,
    "FirstName": firstName,
    "LastName": lastName,
    "PartyListName": partyListName,
  };
}
